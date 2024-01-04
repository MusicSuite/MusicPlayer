from enum import Enum


class State(Enum):
    PLAYING = 1
    PAUSED = 2
    STOPPED = 3

    def __str__(self) -> str:
        return self.name

    def __repr__(self) -> str:
        return str(self)
