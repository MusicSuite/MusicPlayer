from pydantic import BaseModel


class Song(BaseModel):
    id: int
    title: str
    duration: float

    def __init__(self, id: int, title: str, duration: float):
        super().__init__(id=id, title=title, duration=duration)

    def __eq__(self, other):
        assert isinstance(other, Song), "Must compare with a song"
        return self.id == other.id

    def __str__(self) -> str:
        return str(self.model_dump_json())

    def __repr__(self) -> str:
        return str(self)
