from fastapi import APIRouter

from src.model.song import Song
from src.player.console_player import ConsolePlayer

router = APIRouter()
music_player = ConsolePlayer()


@router.get("/queue")
async def queue():
    return music_player.queue.__getstate__()


@router.get("/queue/add")
async def add(song_json: dict):
    song = Song.from_json(song_json)
    music_player.queue_song(song)
    return Song.to_json(song)


@router.get("/queue/peek")
async def peek():
    song = music_player.queue.peek()
    return Song.to_json(song)


@router.get("/queue/shuffle")
async def shuffle():
    music_player.queue.shuffle()
