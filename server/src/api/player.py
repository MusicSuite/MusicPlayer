from fastapi import APIRouter

from src.model.song import Song
from src.model.state import State
from src.player.console_player import console_player as music_player, ConsolePlayer

router = APIRouter()


@router.get("/player")
async def player() -> ConsolePlayer:
    return music_player


@router.get("/player/playing")
async def playing() -> Song:
    if music_player.state == State.PLAYING:
        return music_player.queue.peek()
