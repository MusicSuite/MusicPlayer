SONG_ID = 0


class Song:
    def __init__(self, title: str, duration: float) -> None:
        global SONG_ID
        self.id: int = SONG_ID
        SONG_ID += 1
        self.title: str = title
        self.duration: float = duration

    def __eq__(self, other):
        assert isinstance(other, Song), "Must compare with a song"
        return self.title == other.title and self.duration == other.duration

    def __str__(self) -> str:
        return str({
            "id": self.id,
            "title": self.title,
            "duration": self.duration
        })

    def __repr__(self) -> str:
        return str(self)
