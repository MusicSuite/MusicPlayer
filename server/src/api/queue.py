from fastapi import APIRouter

from src.model.song import Song
from src.player.console_player import console_player as music_player
from src.utils import json_loader

router = APIRouter()


@router.get("/queue")
async def queue() -> list[Song]:
    return music_player.queue


@router.post("/queue/{song_id}")
async def add(song_id: int) -> None:
    song = json_loader.get_song(song_id)
    if song:
        music_player.queue.add(song)


@router.get("/queue/shuffle")
async def shuffle() -> None:
    music_player.queue.shuffle()
