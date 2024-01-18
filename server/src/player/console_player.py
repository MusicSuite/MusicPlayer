import asyncio
import json
import logging
import threading
import time

from fastapi import WebSocket, WebSocketDisconnect
from src.model.playerstate import PlayerState
from src.model.websocket_message_type import WebSocketMessageType
from src.player.base_player import BasePlayer
from src.utils.connection_manager import ConnectionManager
from src.utils.json_loader import get_songs_json


class ConsolePlayer(BasePlayer):
    _thread: threading.Thread = None
    _stop_event: threading.Event = None
    _state_updated: bool = False
    _manager: ConnectionManager
    song_position: int = 0

    def __init__(self):
        super().__init__()
        # NOTE: DO NOT INIT THE variables below earlier, if initiated it cannot pickle
        self._stop_event = threading.Event()
        self._manager = ConnectionManager()

    def play(self) -> None:
        if self.state == PlayerState.PLAYING:
            return

        if not self.current_song:
            self.current_song = self.queue.get()
            if not self.current_song:
                return

            self.song_position = 0

        super().play()
        duration_left = self.current_song.duration - self.song_position
        self._start_timer(duration_left)
        self.set_updated()

    def pause(self) -> None:
        if not self.current_song or self.state == PlayerState.PAUSED:
            return

        super().pause()
        self._stop_timer()
        self.set_updated()

    def stop(self) -> None:
        if not self.current_song and self.state == PlayerState.STOPPED:
            return

        super().stop()
        self._stop_timer()
        self.set_updated()

    def next_track(self) -> None:
        self.stop()
        super().next_track()
        self.song_position = 0
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

    # Threading stuff to keep the song position
    def _start_timer(self, duration):
        self._stop_timer()
        self._stop_event.clear()
        self._thread = threading.Thread(target=self._start_timer_loop, args=(duration,))
        self._thread.start()

    def _stop_timer(self):
        if self._thread is not None and self._thread.is_alive():
            self._stop_event.set()
            # TODO: Check whether thread needs to be joined or can be ignored
            # self.thread.join()

    def _start_timer_loop(self, duration):
        # Create a new event loop for the thread
        loop = asyncio.new_event_loop()
        asyncio.set_event_loop(loop)

        # Run the asynchronous function
        loop.run_until_complete(self._start_time(duration))

        # Close the event loop
        loop.close()

    async def _start_time(self, duration):
        start_time = time.time()

        while time.time() - start_time < duration and not self._stop_event.is_set():
            time.sleep(1)

            if self.state == PlayerState.PLAYING:
                self.song_position += 1
                logging.debug("+1")

        if not self._stop_event.is_set():
            self._stop_event.clear()
            self.next_track()
            # Since this is not from an api call, we need to manually call the broadcast
            await self._update_state()

    def __str__(self) -> str:
        return str(self.model_dump_json())

    def __del__(self):
        self._stop_timer()


console_player = ConsolePlayer()
