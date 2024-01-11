from fastapi import APIRouter

from src.model.song import Song
from src.utils import json_loader
from src.utils.json_loader import load_songs_from_json

router = APIRouter()


@router.get("/songs")
async def songs() -> list[Song]:
    return load_songs_from_json()


@router.post("/songs/add")
async def add(song: Song) -> None:
    json_loader.add_song_to_json(song)


@router.delete("/songs/remove/{song_id}")
async def remove(song_id: int) -> None:
    json_loader.remove_song(song_id)


@router.put("/songs/replace")
async def rename(old_song: Song, new_song: Song) -> None:
    json_loader.replace_song(old_song, new_song)
