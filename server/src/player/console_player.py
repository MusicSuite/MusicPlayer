import logging
import threading
import time

from src.model.playerstate import PlayerState
from src.player.base_player import BasePlayer


class ConsolePlayer(BasePlayer):
    _thread: threading.Thread = None
    _stop_event: threading.Event = None
    song_position: int = 0

    def __init__(self):
        super().__init__()
        # NOTE: DO NOT INIT THE variable above, if initiated it cannot pickle
        self._stop_event = threading.Event()

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

    def pause(self) -> None:
        if not self.current_song or self.state == PlayerState.PAUSED:
            return

        super().pause()
        self._stop_timer()

    def stop(self) -> None:
        if not self.current_song and self.state == PlayerState.STOPPED:
            return

        super().stop()
        self._stop_timer()

    def next_track(self) -> None:
        self.stop()
        super().next_track()
        self.play()

    def current_song_elapsed_time(self) -> float:
        return self.song_position

    def set_song_position(self, position: float) -> None:
        if position > self.current_song_duration():
            position = self.current_song_duration()
        elif position < 0:
            position = 0

        self.song_position = position

    # Threading stuff to keep the song position
    def _start_timer(self, duration):
        self._stop_timer()
        self._stop_event.clear()
        self._thread = threading.Thread(target=self._timer_thread, args=(duration,))
        self._thread.start()

    def _stop_timer(self):
        if self._thread is not None and self._thread.is_alive():
            self._stop_event.set()
            # TODO: Check whether thread needs to be joined or can be ignored
            # self.thread.join()

    def _timer_thread(self, duration):
        start_time = time.time()

        while time.time() - start_time < duration and not self._stop_event.is_set():
            time.sleep(1)

            if self.state == PlayerState.PLAYING:
                self.song_position += 1
                logging.debug("+1")

        if not self._stop_event.is_set():
            self.next_track()

    def __str__(self) -> str:
        return str(self.model_dump_json())

    def __del__(self):
        self._stop_timer()


console_player = ConsolePlayer()
