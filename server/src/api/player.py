from fastapi import APIRouter

from src.model.state import State
from src.player.console_player import console_player as music_player

router = APIRouter()


@router.get("/player")
async def player():
    return music_player


@router.get("/player/playing")
async def playing():
    if music_player.state == State.PLAYING:
        return music_player.queue.peek()
