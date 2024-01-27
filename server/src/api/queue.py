import logging

from fastapi import APIRouter
from src.model.song import Song
from src.player.console_player import console_player as music_player
from src.utils import json_loader

router = APIRouter()


@router.get("/queue")
async def queue() -> list[Song]:
    return music_player.queue.queue


@router.post("/queue/{song_id}")
async def add(song_id: int) -> None:
    song = json_loader.get_song(song_id)
    if not song:
        logging.warning(f"Tried to add song (id={song_id}) to queue, but was not found")
        return

    music_player.queue.add(song)
    await broadcast_queue()


@router.delete("/queue/{index}")
async def remove(index: int) -> None:
    if not valid_queue_index(index):
        return

    music_player.queue.remove(index)
    await broadcast_queue()


@router.put("/queue/{index}/{new_index}")
async def move(index: int, new_index: int) -> None:
    if not valid_queue_index(index):
        return

    if not 0 <= new_index <= len(music_player.queue):
        logging.warning("Wrong new index")
        return

    music_player.queue.move(index, new_index)
    await broadcast_queue()


def valid_queue_index(queue_index: int) -> bool:
    is_valid = 0 <= queue_index < len(music_player.queue)
    if not is_valid:
        logging.warning("Invalid index")

    return is_valid


async def broadcast_queue() -> None:
    json_response: dict = music_player.queue.model_dump()
    logging.info(f"Broadcast: {json_response}")
    await music_player._manager.broadcast(json_response)
