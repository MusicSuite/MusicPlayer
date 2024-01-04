import json
import logging

from src.model.song import Song

FILE_PATH = "../data/songs.json"


def load_songs_from_json() -> list[Song]:
    with open(FILE_PATH, 'r') as file:
        songs_data = json.load(file)

    return [json_to_song(song_data) for song_data in songs_data]


def write_songs_to_json(songs: list[Song]) -> None:
    json_songs = [song_to_json(song) for song in songs]

    with open(FILE_PATH, 'w') as file:
        json.dump(json_songs, file, indent=2)


def add_song_to_json(new_song: Song) -> None:
    logging.info(f"Adding song to json: {new_song}")
    songs: list[Song] = load_songs_from_json()
    songs.append(new_song)
    write_songs_to_json(songs)


def remove_song(del_song: Song) -> bool:
    songs = load_songs_from_json()
    old_len = len(songs)
    songs.remove(del_song)
    new_len = len(songs)

    if old_len != new_len:
        logging.info(f"Remove song from json: {del_song}")
        write_songs_to_json(songs)
        return True

    logging.warning(f"Remove failed, song not found ({del_song})")
    return False


def replace_song(old_song: Song, new_song: Song) -> bool:
    songs = load_songs_from_json()

    for i, song in enumerate(songs):
        if song == old_song:
            logging.info(f"Replacing song in json {old_song} --> {new_song}")
            songs[i] = new_song
            write_songs_to_json(songs)
            return True

    logging.warning(f"Replacement failed, song not found ({old_song})")
    return False


def json_to_song(json_song: json) -> Song:
    return Song(json_song["title"], json_song["duration"])


def song_to_json(song: Song) -> json:
    return {
        "title": song.title or "UNKNOWN TITLE",
        "duration": song.duration or 0
    }
