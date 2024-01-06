from typing import Union
import random

from src.model.song import Song


class MusicQueue:
    _queue: list[Song] = []

    def get(self) -> Union[Song, None]:
        if self.is_empty():
            return None

        return self._queue.pop(0)

    def add(self, song: Song) -> None:
        assert song, "Must put a valid song in"
        self._queue.append(song)

    def peek(self) -> Union[Song, None]:
        if self.is_empty():
            return None

        return self._queue[0]

    def shuffle(self):
        random.shuffle(self._queue)

    def is_empty(self) -> bool:
        return len(self) == 0

    def __getstate__(self):
        return [song.__getstate__() for song in self._queue]

    def __len__(self) -> int:
        return len(self._queue)

    def __str__(self) -> str:
        return str(self.__getstate__())

    def __repr__(self) -> str:
        return str(self)


if __name__ == "__main__":
    queue = MusicQueue()
    print(queue)
    queue.add(Song("title1", 200))
    queue.add(Song("title2", 200))
    queue.add(Song("title3", 200))
    print(queue)
    print(queue.peek())
    queue.get()
    print(queue)
