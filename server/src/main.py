import src.utils.logger as logger

from fastapi import FastAPI
from src.api.player import router as player_router
from src.api.player_actions import router as player_actions_router
from src.api.queue import router as queue_router
from src.api.songs import router as songs_router
from src.api.websocket import router as websocket_router


logger.initialize()
app = FastAPI()
app.include_router(player_router)
app.include_router(player_actions_router)
app.include_router(queue_router)
app.include_router(songs_router)
app.include_router(websocket_router)
