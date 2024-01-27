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
        # If it moves down, we need to take into account the new index moves after we remove the new
        if old_index < new_index:
            new_index -= 1

        temp: Song = self.queue.pop(old_index)

        self.queue.insert(new_index, temp)

    def is_empty(self) -> bool:
        return len(self) == 0

    def __len__(self) -> int:
        return len(self.queue)

    def __str__(self) -> str:
        return str(self.model_dump_json())
