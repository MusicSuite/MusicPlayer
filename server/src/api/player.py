from fastapi import APIRouter

from src.player.console_player import console_player as music_player, ConsolePlayer

router = APIRouter()


@router.get("/player")
async def player() -> ConsolePlayer:
    return music_player
