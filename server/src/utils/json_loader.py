import json
import logging
import os.path
import os

from src.model.song import Song

CURRENT_DIR = os.path.dirname(os.path.abspath(__file__))
FILE_PATH = os.path.join(CURRENT_DIR, "..", "..", "data", "songs.json")


def songs_json() -> json:
    abs_path = os.path.abspath(FILE_PATH)
    with open(abs_path, 'r') as file:
        songs_data = json.load(file)

    return songs_data


def load_songs_from_json() -> list[Song]:
    return [Song.from_json(song_data) for song_data in songs_json()]


def _write_songs_to_json(songs: list[Song]) -> None:
    json_songs = [Song.to_json(song) for song in songs]

    with open(FILE_PATH, 'w') as file:
        json.dump(json_songs, file, indent=2)


def add_song_to_json(new_song: Song) -> None:
    logging.info(f"Adding song to json: {new_song}")
    songs: list[Song] = load_songs_from_json()
    songs.append(new_song)
    _write_songs_to_json(songs)


def remove_song(del_song: Song) -> bool:
    songs = load_songs_from_json()
    old_len = len(songs)
    songs.remove(del_song)
    new_len = len(songs)

    if old_len != new_len:
        logging.info(f"Remove song from json: {del_song}")
        _write_songs_to_json(songs)
        return True

    logging.warning(f"Remove failed, song not found ({del_song})")
    return False


def replace_song(old_song: Song, new_song: Song) -> bool:
    songs = load_songs_from_json()

    for i, song in enumerate(songs):
        if song == old_song:
            logging.info(f"Replacing song in json {old_song} --> {new_song}")
            songs[i] = new_song
            _write_songs_to_json(songs)
            return True

    logging.warning(f"Replacement failed, song not found ({old_song})")
    return False
