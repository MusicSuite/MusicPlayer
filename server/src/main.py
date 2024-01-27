import argparse
import json
import logging

import src.utils.logger as logger
import uvicorn
import yaml
from fastapi import FastAPI
from src.api.images import router as thumbnail_router
from src.api.player import router as player_router
from src.api.player_actions import router as player_actions_router
from src.api.queue import router as queue_router
from src.api.songs import router as songs_router
from src.api.websocket import router as websocket_router

HOST_IP = "127.0.0.1"
PORT = 8000


def parse_args():
    parser = argparse.ArgumentParser(description="Music Server")
    parser.add_argument("--run", type=lambda x: x.lower() == 'true', default=True, help="Whether to run the server (default: True)")
    return parser.parse_args()


def create_app() -> FastAPI:
    app = FastAPI(title="Music Server")
    app.openapi_version = "3.0.3"
    app.include_router(player_router)
    app.include_router(player_actions_router)
    app.include_router(queue_router)
    app.include_router(songs_router)
    app.include_router(websocket_router)
    app.include_router(thumbnail_router)
    return app


def generate_json(app: FastAPI):
    with open('../data/openapi.json', 'w') as f:
        json.dump(app.openapi(), f, indent=2)


def generate_yaml(app: FastAPI):
    with open('../data/openapi.yaml', 'w') as f:
        yaml.dump(app.openapi(), f)


if __name__ == "__main__":
    args = parse_args()
    logger.initialize()
    music_app = create_app()
    generate_json(music_app)

    if args.run:
        uvicorn.run(music_app, host=HOST_IP, port=PORT)
    else:
        logging.info("Completed.. (only generated)")
