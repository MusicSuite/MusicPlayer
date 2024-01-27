import json
import logging
import os
import os.path
from typing import Optional, Any

from src.model.song import Song

CURRENT_DIR = os.path.dirname(os.path.abspath(__file__))
FILE_PATH = os.path.join(CURRENT_DIR, "..", "..", "data", "songs.json")


def _filter_out_null(json_data: list[tuple[Any, Any]]) -> dict[Any, Any]:
    return {json_entry[0]: json_entry[1] for json_entry in json_data if json_entry[1] is not None}


def get_songs_json() -> dict:
    abs_path = os.path.abspath(FILE_PATH)
    with open(abs_path, 'r') as file:
        songs_data = json.load(file, object_pairs_hook=_filter_out_null)

    return songs_data


def get_songs() -> list[Song]:
    return [Song(**song_data) for song_data in get_songs_json()]


def _write_songs_to_json(songs: list[Song]) -> None:
    assert isinstance(songs, list), "Songs must be of type list"
    model_json = [song.model_dump() for song in songs]

    with open(FILE_PATH, 'w') as file:
        json.dump(model_json, file, indent=2)


def get_song(song_id: int) -> Optional[Song]:
    assert isinstance(song_id, int), "Must search based on ID"
    return find_song(song_id, get_songs())


def find_song(song_id: int, songs: list[Song]) -> Optional[Song]:
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
    song: Song = get_song(song_id)

    if not song:
        logging.warning(f"Remove failed, song with id={song_id} not found")
        return False

    songs = get_songs()
    songs.remove(song)
    logging.info(f"Remove song from json (id={song_id})")
    _write_songs_to_json(songs)
    return True


def replace_song(song_id: int, new_song: Song) -> bool:
    if song_id != new_song.id:
        logging.warning(f"Tried to replace a song with a song of a different ID")
        return False

    if not remove_song(song_id):
        logging.warning(f"Replacement failed, song not found (id={song_id})")
        return False

    songs: list[Song] = get_songs()
    songs.append(new_song)
    _write_songs_to_json(songs)
    return True


# def set_song_thumbnail_file_name(song_id: int, thumbnail_file_name: Optional[str]) -> bool:
#     songs: list[Song] = get_songs()
#     song = find_song(song_id, songs)
#     if not song:
#         logging.warning(f"Could not find song to change thumbnail file name")
#         return False
#
#     song.thumbnail_file_name = thumbnail_file_name
#     _write_songs_to_json(songs)
#     return True
