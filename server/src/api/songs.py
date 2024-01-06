from fastapi import APIRouter

from src.model.song import Song
from src.utils import json_loader
from src.utils.json_loader import songs_json

router = APIRouter()


@router.get("/songs")
async def songs():
    return songs_json()


@router.post("/songs/add")
async def add(song: Song):
    json_loader.add_song_to_json(song)


@router.delete("/songs/remove")
async def remove(song: Song):
    json_loader.remove_song(song)


@router.put("/songs/replace")
async def rename(old_song: Song, new_song: Song):
    json_loader.replace_song(old_song, new_song)
