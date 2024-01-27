import logging
import os
import shutil

import src.utils.json_loader as json_loader
from fastapi import File, UploadFile, HTTPException, APIRouter
from fastapi.responses import FileResponse

router = APIRouter()

UPLOAD_DIR = "../images"
os.makedirs(UPLOAD_DIR, exist_ok=True)


@router.get("/images/song/{song_id}")
async def image(song_id: int) -> FileResponse:
    song = json_loader.get_song(song_id)
    if not song or not song.thumbnail_file_name:
        logging.warning("Song id not found or file name not set")
        raise HTTPException(status_code=404, detail="Image resource not set")

    file_path = os.path.join(UPLOAD_DIR, song.thumbnail_file_name)
    if not os.path.exists(file_path):
        raise HTTPException(status_code=404, detail="Image not found")

    return FileResponse(file_path)


@router.get("/images/file/{file_name}")
async def image(file_name: str) -> FileResponse:
    file_path = os.path.join(UPLOAD_DIR, file_name)
    if not os.path.exists(file_path):
        raise HTTPException(status_code=404, detail="Image not found")

    return FileResponse(file_path)


@router.post("/images")
async def create(file: UploadFile = File(...)) -> None:
    file_path = os.path.join(UPLOAD_DIR, file.filename)

    try:
        with open(file_path, "wb") as image:
            shutil.copyfileobj(file.file, image)
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))
