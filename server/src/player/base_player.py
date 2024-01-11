import threading
from abc import ABC, abstractmethod
import logging
from typing import ClassVar

from pydantic import BaseModel

from src.model.song import Song
from src.model.state import State
from src.utils.music_queue import MusicQueue


class BasePlayer(ABC, BaseModel):
    state: State = None
    queue: MusicQueue = MusicQueue()
    volume: int = 60
    _instance: None = None

    def __init__(self):
        super().__init__()
        # NOTE: DO NOT INIT THE variable above, if initiated it cannot generate the dio code (because enum)
        self.state = State.STOPPED

    @abstractmethod
    def play(self) -> None:
        logging.info("PLAY")
        self.state = State.PLAYING

    @abstractmethod
    def pause(self) -> None:
        logging.info("PAUSE")
        self.state = State.PAUSED

    @abstractmethod
    def stop(self) -> None:
        logging.info("STOP")
        self.state = State.STOPPED

    @abstractmethod
    def next_track(self) -> None:
        logging.info("NEXT TRACK")
        self.queue.get()

    def set_volume(self, volume: int) -> None:
        volume = int(max(0, min(volume, 100)))
        self.volume = volume

    def current_song(self) -> Song:
        return self.queue.peek()

    def current_song_duration(self) -> float:
        song = self.current_song()
        if not song:
            return 0

        return song.duration

    @abstractmethod
    def current_song_elapsed_time(self) -> float:
        pass

    @abstractmethod
    def set_song_position(self, position: float) -> None:
        pass

    def queue_songs(self, songs: list[Song]) -> None:
        for song in songs:
            self.queue_song(song)

    def queue_song(self, song: Song) -> None:
        self.queue.add(song)

    def clear_queue(self) -> None:
        self.queue = MusicQueue()

    @abstractmethod
    def __str__(self) -> str:
        pass
