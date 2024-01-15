from enum import Enum

from fastapi import APIRouter, WebSocket, WebSocketDisconnect
from src.player.console_player import console_player as music_player
from src.utils.json_loader import get_songs_json

router = APIRouter()


# https://fastapi.tiangolo.com/advanced/websockets/?h=broadcast#handling-disconnections-and-multiple-clients
class ConnectionManager:
    def __init__(self):
        self.active_connections: list[WebSocket] = []

    async def connect(self, websocket: WebSocket):
        await websocket.accept()
        self.active_connections.append(websocket)

    def disconnect(self, websocket: WebSocket):
        self.active_connections.remove(websocket)

    @staticmethod
    async def send_personal_message(message: str, websocket: WebSocket):
        await websocket.send_text(message)

    async def broadcast(self, json_message: dict):
        for connection in self.active_connections:
            await connection.send_json(json_message)


class WebSocketMessageType(Enum):
    Queue = "queue"
    Songs = "songs"
    Player = "player"


manager = ConnectionManager()


@router.websocket("/ws")
async def websocket_endpoint(websocket: WebSocket):
    print("Client connected to websocket")
    await manager.connect(websocket)
    try:
        while True:
            data: dict = await websocket.receive_json()
            json_response: dict = dict()
            if data['updated'].__contains__(WebSocketMessageType.Queue.value):
                json_response[WebSocketMessageType.Queue.value] = music_player.queue.model_dump_json()
            if data['updated'].__contains__(WebSocketMessageType.Songs.value):
                json_response[WebSocketMessageType.Songs.value] = get_songs_json()
            if data['updated'].__contains__(WebSocketMessageType.Player.value):
                json_response[WebSocketMessageType.Player.value] = music_player.model_dump_json()
            if len(json_response) == 0:
                print(f"type '{data}' not known")

            await manager.broadcast(json_response)
    except WebSocketDisconnect:
        manager.disconnect(websocket)
        print("A client disconnected")
