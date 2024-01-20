import json
import logging

from fastapi import WebSocket, WebSocketDisconnect
from pydantic import computed_field
from src.model.playerstate import PlayerState
from src.model.websocket_message_type import WebSocketMessageType
from src.player.base_player import BasePlayer, ExcludedField
from src.utils.connection_manager import ConnectionManager
from src.utils.json_loader import get_songs_json
from src.utils.song_timer import SongTimer


class ConsolePlayer(BasePlayer):
    _state_updated: bool = False
    _manager: ConnectionManager
    _song_timer: ExcludedField[SongTimer]

    @computed_field
    @property
    def state(self) -> PlayerState:
        return self._song_timer.state

    @computed_field
    @property
    def song_position(self) -> float:
        return self._song_timer.get_song_timer()

    def __init__(self):
        super().__init__()
        # NOTE: DO NOT INIT THE variables below earlier, if initiated it cannot pickle
        self._manager = ConnectionManager()
        self._song_timer = SongTimer()

    def play(self) -> None:
        if self.state is PlayerState.PLAYING:
            logging.warning("Already playing")
            return

        from_beginning = False
        if not self.current_song:
            self.current_song = self.queue.get()
            from_beginning = True

        if not self.current_song:
            logging.warning("No current song or song in queue to play")
            return

        if from_beginning:
            logging.info("Playing song from beginning (id=%d)", self.current_song.id)
            self._song_timer.start(self.current_song.duration, self.__on_finish)
        else:
            logging.info("Playing song from a startpoint (id=%d)", self.current_song.id)
            self._song_timer.resume()

        self.set_updated()

    def pause(self) -> None:
        if self.state is PlayerState.PAUSED:
            logging.warning("Cannot pause if already paused")
            return

        if not self.current_song:
            logging.warning("No song to pause")
            return

        logging.info("Paused")
        self._song_timer.pause()
        self.set_updated()

    def stop(self) -> None:
        if not self.current_song:
            logging.warning("No current song to stop")
            return

        self.current_song = None
        self.set_updated()

        logging.info("Stopping player")
        if self.state is PlayerState.STOPPED:
            return

        self._song_timer.stop()

    def next_track(self) -> None:
        self.stop()
        self.play()

    async def __on_finish(self):
        self.next_track()
        await self._update_state()

    def set_updated(self):
        if not self._state_updated:
            logging.debug("Status marked as updated")
            self._state_updated = True

    async def _handle_connection(self, websocket: WebSocket):
        print("Client connected to websocket")

        await self._manager.connect(websocket)
        try:
            while True:
                data: dict = await websocket.receive_json()
                json_response: dict = dict()
                if WebSocketMessageType.Queue.value in data['updated']:
                    json_response[WebSocketMessageType.Queue.value] = self.queue.model_dump_json()
                if WebSocketMessageType.Songs.value in data['updated']:
                    json_response[WebSocketMessageType.Songs.value] = get_songs_json()
                if WebSocketMessageType.Player.value in data['updated']:
                    json_response[WebSocketMessageType.Player.value] = self.model_dump_json()
                if len(json_response) == 0:
                    print(f"type '{data}' not known")

                await self._manager.broadcast(json_response)
        except WebSocketDisconnect:
            self._manager.disconnect(websocket)
            print("A client disconnected")

    async def _update_state(self):
        if not self._state_updated:
            return

        self._state_updated = False
        json_response: dict = dict()
        json_response[WebSocketMessageType.Player.value] = self.model_dump_json()
        logging.info("Broadcasting: %s", json.dumps(json_response, indent=2))
        await self._manager.broadcast(json_response)

    def __str__(self) -> str:
        return str(self.model_dump_json())
    #
    # def __del__(self):
    #     self.stop()


console_player = ConsolePlayer()
