from abc import ABC, abstractmethod
from typing import TypeVar, Annotated

from pydantic import BaseModel, Field, computed_field
from src.model.playerstate import PlayerState
from src.model.song import Song
from src.utils.music_queue import MusicQueue

T = TypeVar("T")
ExcludedField = Annotated[T, Field(exclude=True)]


class BasePlayer(ABC, BaseModel):
    volume: int = 60
    current_song: Song = None
    queue: ExcludedField[MusicQueue] = MusicQueue()

    @computed_field
    @abstractmethod
    def state(self) -> PlayerState:
        pass

    @computed_field
    @abstractmethod
    def song_position(self) -> float:
        pass

    @abstractmethod
    def play(self) -> None:
        pass

    @abstractmethod
    def pause(self) -> None:
        pass

    @abstractmethod
    def stop(self) -> None:
        pass

    @abstractmethod
    def next_track(self) -> None:
        pass

    def set_volume(self, volume: int) -> None:
        volume = int(max(0, min(volume, 100)))
        if volume == self.volume:
            return

        self.volume = volume

    @abstractmethod
    def __str__(self) -> str:
        pass
