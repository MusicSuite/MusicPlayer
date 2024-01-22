from abc import ABC, abstractmethod
from typing import TypeVar, Annotated

from pydantic import BaseModel, Field, computed_field
from src.model.playerstate import PlayerState
from src.model.song import Song
from src.utils.music_queue import MusicQueue

T = TypeVar("T")
ExcludedField = Annotated[T, Field(exclude=True)]


class BasePlayer(ABC, BaseModel):
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

    @abstractmethod
    def __str__(self) -> str:
        pass
