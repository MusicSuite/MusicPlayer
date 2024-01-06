from fastapi import APIRouter, WebSocket, WebSocketDisconnect
import socketio

from src.player.console_player import ConsolePlayer

router = APIRouter()
sio = socketio.Server()
music_player = ConsolePlayer()


@router.websocket("/ws/{client_id}")
async def websocket_endpoint(websocket: WebSocket, client_id: int):
    await sio.emit('server_message', f"Client {client_id} connected.")
    await websocket.accept()

    try:
        while True:
            data = await websocket.receive_text()
            sio.emit('music_update', data)
    except WebSocketDisconnect:
        await sio.emit('server_message', f"Client {client_id} disconnected.")
