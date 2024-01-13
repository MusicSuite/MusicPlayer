import logging
from abc import ABC, abstractmethod
from typing import TypeVar, Annotated

from pydantic import BaseModel, Field
from src.model.playerstate import PlayerState
from src.model.song import Song
from src.utils.music_queue import MusicQueue

T = TypeVar("T")
ExcludedField = Annotated[T, Field(exclude=True)]


class BasePlayer(ABC, BaseModel):
    state: PlayerState = None
    volume: int = 60
    current_song: Song = None
    queue: ExcludedField[MusicQueue] = MusicQueue()

    def __init__(self):
        super().__init__()
        assert not self.state, "DO NOT INIT THE variable above, if initiated it cannot generate the dio code (because enum)"
        self.state = PlayerState.STOPPED

    @abstractmethod
    def play(self) -> None:
        assert self.current_song, "There must be a song to be playing"
        logging.info("PLAY")
        self.state = PlayerState.PLAYING

    @abstractmethod
    def pause(self) -> None:
        assert self.current_song, "There must be a song to pause"
        logging.info("PAUSE")
        self.state = PlayerState.PAUSED

    @abstractmethod
    def stop(self) -> None:
        logging.info("STOP")
        self.state = PlayerState.STOPPED
        self.current_song = None

    @abstractmethod
    def next_track(self) -> None:
        logging.info("NEXT TRACK")
        self.current_song = self.queue.get()

    def set_volume(self, volume: int) -> None:
        volume = int(max(0, min(volume, 100)))
        if volume == self.volume:
            return

        self.volume = volume

    def current_song_duration(self) -> float:
        if not self.current_song:
            return 0

        return self.current_song.duration

    @abstractmethod
    def current_song_elapsed_time(self) -> float:
        pass

    @abstractmethod
    def set_song_position(self, position: float) -> None:
        pass

    @abstractmethod
    def __str__(self) -> str:
        pass
