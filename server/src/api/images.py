import os
import shutil

from fastapi import File, UploadFile, HTTPException, APIRouter
from fastapi.responses import FileResponse

router = APIRouter()

UPLOAD_DIR = "../images"
os.makedirs(UPLOAD_DIR, exist_ok=True)


@router.get("/images/{filename}")
async def image(filename: str) -> FileResponse:
    file_path = os.path.join(UPLOAD_DIR, filename)
    if not os.path.exists(file_path):
        raise HTTPException(status_code=404, detail="Image not found")

    return FileResponse(file_path, media_type="image/jpg")


@router.post("/images/")
async def image(file: UploadFile = File(...)) -> dict[str, str]:
    try:
        # Save the uploaded image to the server
        file_path = os.path.join(UPLOAD_DIR, file.filename)
        with open(file_path, "wb") as image:
            shutil.copyfileobj(file.file, image)

        return {"file_path": file_path}

    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))
