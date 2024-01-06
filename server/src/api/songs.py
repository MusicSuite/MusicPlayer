from fastapi import APIRouter

from src.model.song import Song
from src.player.console_player import ConsolePlayer
from src.utils import json_loader
from src.utils.json_loader import songs_json

router = APIRouter()
music_player = ConsolePlayer()


@router.get("/songs")
async def songs():
    return songs_json()


@router.post("/songs/add")
async def add(song_json: dict):
    song = Song.from_json(song_json)
    json_loader.add_song_to_json(song)
    return song


@router.delete("/songs/remove")
async def remove(song_json: dict):
    song = Song.from_json(song_json)
    json_loader.remove_song(song)


@router.put("/songs/replace")
async def rename(old_song_json: dict, new_song_json: dict):
    old_song = Song.from_json(old_song_json)
    new_song = Song.from_json(new_song_json)
    json_loader.replace_song(old_song, new_song)
