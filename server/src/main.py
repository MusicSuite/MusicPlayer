import json

import src.utils.logger as logger
import uvicorn
from fastapi import FastAPI
from src.api.player import router as player_router
from src.api.player_actions import router as player_actions_router
from src.api.queue import router as queue_router
from src.api.songs import router as songs_router
from src.api.websocket import router as websocket_router

HOST_IP = "127.0.0.1"
PORT = 8000


def run_server():
    app = FastAPI(title="CustomTitle")
    app.include_router(player_router)
    app.include_router(player_actions_router)
    app.include_router(queue_router)
    app.include_router(songs_router)
    app.include_router(websocket_router)

    # Write most recent openapi file
    with open('../data/openapi.json', 'w') as f:
        json.dump(app.openapi(), f, indent=2)

    uvicorn.run(app, host=HOST_IP, port=PORT)


if __name__ == "__main__":
    logger.initialize()
    run_server()
