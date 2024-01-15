import json
import logging
import os
import os.path

from src.model.song import Song

CURRENT_DIR = os.path.dirname(os.path.abspath(__file__))
FILE_PATH = os.path.join(CURRENT_DIR, "..", "..", "data", "songs.json")


def get_songs_json() -> dict:
    abs_path = os.path.abspath(FILE_PATH)
    with open(abs_path, 'r') as file:
        songs_data = json.load(file)

    return songs_data


def get_songs() -> list[Song]:
    return [Song(**song_data) for song_data in get_songs_json()]


def _write_songs_to_json(songs: list[Song]) -> None:
    assert isinstance(songs, list), "Songs must be of type list"
    model_json = [song.model_dump() for song in songs]

    with open(FILE_PATH, 'w') as file:
        json.dump(model_json, file, indent=2)


def get_song(song_id: int) -> Song:
    assert isinstance(song_id, int), "Must search based on ID"
    songs = get_songs()
    return next((song for song in songs if song.id == song_id), None)


def add_song(new_song: Song) -> Song:
    songs: list[Song] = get_songs()
    candidate_ids = set(range(len(songs) + 1))
    song_ids = set([song.id for song in songs])
    first_missing_id = list(candidate_ids - song_ids)[0]
    new_song.id = first_missing_id

    logging.info(f"Adding song to json: {new_song}")
    songs.append(new_song)
    _write_songs_to_json(songs)
    return new_song


def remove_song(song_id: int) -> bool:
    assert isinstance(song_id, int), "Remove song based on id"
    song = get_song(song_id)

    if not song:
        logging.warning(f"Remove failed, song with id not found (id={song_id})")
        return False

    songs = get_songs()
    songs.remove(song)
    logging.info(f"Remove song from json (id={song_id})")
    _write_songs_to_json(songs)
    return True


def replace_song(old_song: Song, new_song: Song) -> bool:
    songs = get_songs()

    for i, song in enumerate(songs):
        if song == old_song:
            logging.info(f"Replacing song in json {old_song} --> {new_song}")
            songs[i] = new_song
            _write_songs_to_json(songs)
            return True

    logging.warning(f"Replacement failed, song not found ({old_song})")
    return False
