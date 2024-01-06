from fastapi import APIRouter

from src.player.console_player import ConsolePlayer

router = APIRouter()
music_player = ConsolePlayer()


@router.get("/player/actions/play")
async def play():
    music_player.play()


@router.get("/player/actions/pause")
async def pause():
    music_player.pause()


@router.get("/player/actions/stop")
async def stop():
    music_player.stop()


@router.get("/player/actions/next_track")
async def next_track():
    music_player.next_track()
