from enum import Enum


class WebSocketMessageType(Enum):
    Queue = "queue"
    Songs = "songs"
    Player = "player"
