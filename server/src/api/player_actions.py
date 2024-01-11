from fastapi import APIRouter

from src.player.console_player import console_player as music_player

router = APIRouter()


@router.get("/player/actions/play")
async def play() -> None:
    music_player.play()


@router.get("/player/actions/pause")
async def pause() -> None:
    music_player.pause()


@router.get("/player/actions/stop")
async def stop() -> None:
    music_player.stop()


@router.get("/player/actions/next_track")
async def next_track() -> None:
    music_player.next_track()
