from fastapi import APIRouter

from src.model.song import Song
from src.player.console_player import console_player as music_player

router = APIRouter()


@router.get("/queue")
async def queue():
    return music_player.queue


@router.get("/queue/add")
async def add(song: Song):
    music_player.queue_song(song)


@router.get("/queue/peek")
async def peek():
    return music_player.queue.peek()


@router.get("/queue/shuffle")
async def shuffle():
    music_player.queue.shuffle()
