import os
import shutil
from pathlib import Path

from fastapi import FastAPI, File, UploadFile, HTTPException
from fastapi.responses import FileResponse

app = FastAPI()

# Directory to store uploaded images
UPLOAD_DIR = "uploaded_images"
Path(UPLOAD_DIR).mkdir(parents=True, exist_ok=True)


@app.post("/upload_image/")
async def upload_image(file: UploadFile = File(...)):
    try:
        # Save the uploaded image to the server
        file_path = os.path.join(UPLOAD_DIR, file.filename)
        with open(file_path, "wb") as image:
            shutil.copyfileobj(file.file, image)

        return {"file_path": file_path}

    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))


@app.get("/get_image/{image_filename}")
async def get_image(image_filename: str):
    try:
        # Return the image file in the response
        file_path = os.path.join(UPLOAD_DIR, image_filename)
        return FileResponse(file_path, media_type="image/jpeg")

    except FileNotFoundError:
        raise HTTPException(status_code=404, detail="Image not found")
