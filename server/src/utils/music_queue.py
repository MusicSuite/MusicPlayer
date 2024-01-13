from typing import Union

from pydantic import BaseModel
from src.model.song import Song


class MusicQueue(BaseModel):
    queue: list[Song] = []

    def get(self) -> Union[Song, None]:
        if self.is_empty():
            return None

        return self.queue.pop(0)

    def add(self, song: Song) -> None:
        assert song, "Must put a valid song in"
        self.queue.append(song)

    def is_empty(self) -> bool:
        return len(self) == 0

    def __len__(self) -> int:
        return len(self.queue)

    def __str__(self) -> str:
        return str(self.model_dump_json())
