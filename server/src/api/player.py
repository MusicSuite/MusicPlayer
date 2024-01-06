from fastapi import APIRouter

from src.model.song import Song
from src.player.console_player import ConsolePlayer

router = APIRouter()
music_player = ConsolePlayer()


@router.get("/player")
async def player():
    return music_player.__getstate__()


@router.get("/player/playing")
async def playing():
    song = music_player.queue.peek()
    return Song.to_json(song)
