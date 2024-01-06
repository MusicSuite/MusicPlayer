from typing import Union
import random

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

    def peek(self) -> Union[Song, None]:
        if self.is_empty():
            return None

        return self.queue[0]

    def shuffle(self):
        random.shuffle(self.queue)

    def is_empty(self) -> bool:
        return len(self) == 0

    def __len__(self) -> int:
        return len(self.queue)

    def __str__(self) -> str:
        return str(self.model_dump_json())

    def __repr__(self) -> str:
        return str(self)


if __name__ == "__main__":
    queue = MusicQueue()
    print(queue)
    queue.add(Song(0, "title1", 200))
    queue.add(Song(0, "title2", 200))
    queue.add(Song(0, "title3", 200))
    print(queue)
    print(queue.peek())
    queue.get()
    print(queue)
