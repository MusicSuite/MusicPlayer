from pydantic import BaseModel, Field


class Song(BaseModel):
    id: int
    title: str
    artist: str
    duration: float
    thumbnail_file_name: str = Field(None, nullable=True)

    def __eq__(self, other):
        assert isinstance(other, Song), "Must compare with a song"
        return self.id == other.id

    def __str__(self) -> str:
        return str(self.model_dump_json())

    def __repr__(self) -> str:
        return str(self)


if __name__ == "__main__":
    song_data = {
        "title": "hi",
        "artist": "hi",
        "id": 0,
        "duration": 3,
        "thumbnail_file_name": None
    }

    filtered_song_data = {key: value for key, value in song_data.items() if value is not None}
    print(filtered_song_data)

    Song(**song_data)
