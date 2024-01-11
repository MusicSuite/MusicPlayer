import json
from pydantic import BaseModel

SONG_ID = 0


class Song(BaseModel):
    id: int
    title: str
    duration: float

    def __init__(self, title: str, duration: float):
        global SONG_ID
        super().__init__(id=SONG_ID, title=title, duration=duration)
        SONG_ID += 1

    def __eq__(self, other):
        assert isinstance(other, Song), "Must compare with a song"
        return self.title == other.title and self.duration == other.duration

    def __str__(self) -> str:
        return str(self.model_dump_json())

    def __repr__(self) -> str:
        return str(self)


if __name__ == "__main__":
    song1 = Song("Test", 5)
    song2 = Song("Test", 5)
    song3 = Song("Test", 5)
    print(song1.model_dump_json())
    print(song2.model_dump_json())
    print(song3.model_dump_json())
