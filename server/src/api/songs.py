from fastapi import APIRouter

from src.model.song import Song
from src.utils import json_loader
from src.utils.json_loader import get_songs

router = APIRouter()


@router.get("/songs")
async def songs() -> list[Song]:
    return get_songs()


@router.get("/songs/{song_id}")
async def song(song_id: int) -> Song:
    return json_loader.get_song(song_id)


@router.post("/songs/add")
async def add(song: Song) -> Song:
    return json_loader.add_song(song)


@router.delete("/songs/remove/{song_id}")
async def remove(song_id: int) -> None:
    json_loader.remove_song(song_id)


@router.put("/songs/replace")
async def rename(old_song: Song, new_song: Song) -> None:
    json_loader.replace_song(old_song, new_song)
