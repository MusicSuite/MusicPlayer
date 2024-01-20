from fastapi import APIRouter, WebSocket

from src.player.console_player import console_player as music_player

router = APIRouter()


@router.websocket("/ws")
async def websocket_endpoint(websocket: WebSocket):
    await music_player._handle_connection(websocket)
