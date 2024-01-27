import logging

from fastapi import APIRouter
from src.model.song import Song
from src.model.websocket_message_type import WebSocketMessageType
from src.player.console_player import console_player as music_player
from src.utils import json_loader
from src.utils.json_loader import get_songs, get_songs_json

router = APIRouter()


@router.get("/songs")
async def songs() -> list[Song]:
    return get_songs()


@router.get("/songs/{song_id}")
async def song(song_id: int) -> Song:
    return json_loader.get_song(song_id)


@router.post("/songs/add")
async def add(song: Song) -> Song:
    new_song = json_loader.add_song(song)
    await broadcast_song_list()
    return new_song


@router.delete("/songs/{song_id}")
async def remove(song_id: int) -> None:
    if json_loader.remove_song(song_id):
        await broadcast_song_list()


@router.put("/songs/{song_id}")
async def rename(song_id: int, new_song: Song) -> None:
    if json_loader.replace_song(song_id, new_song):
        await broadcast_song_list()


async def broadcast_song_list() -> None:
    json_response: dict = dict()
    json_response[WebSocketMessageType.Songs.value] = get_songs_json()
    logging.info(f"Broadcast: {json_response}")
    await music_player._manager.broadcast(json_response)
