from pydantic import BaseModel


class Song(BaseModel):
    id: int
    title: str
    artist: str
    duration: float
    thumbnail_file_name: str

    def __eq__(self, other):
        assert isinstance(other, Song), "Must compare with a song"
        return self.id == other.id

    def __str__(self) -> str:
        return str(self.model_dump_json())

    def __repr__(self) -> str:
        return str(self)
