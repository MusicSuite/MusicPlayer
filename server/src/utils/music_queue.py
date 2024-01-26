from pydantic import BaseModel
from src.model.song import Song


class MusicQueue(BaseModel):
    queue: list[Song] = []

    def get(self) -> Song | None:
        if self.is_empty():
            return None

        return self.queue.pop(0)

    def add(self, song: Song) -> None:
        self.queue.append(song)

    def remove(self, index: int) -> None:
        self.queue.pop(index)

    def move(self, old_index: int, new_index: int) -> None:
        temp: Song = self.queue.pop(old_index)

        # Note inserts before the new index, we don't need to minus 1 if it moves up
        self.queue.insert(new_index, temp)

    def is_empty(self) -> bool:
        return len(self) == 0

    def __len__(self) -> int:
        return len(self.queue)

    def __str__(self) -> str:
        return str(self.model_dump_json())
