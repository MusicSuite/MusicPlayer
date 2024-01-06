import time

from src.model.song import Song
from src.player.console_player import ConsolePlayer
from src.utils.json_loader import load_songs_from_json


def play_songs():
    music_player = ConsolePlayer()
    songs: list[Song] = load_songs_from_json()
    music_player.queue_songs(songs)
    music_player.play()
    print(music_player)
    time.sleep(6)
    # music_player.pause()
    print(music_player)
    time.sleep(2)
    # music_player.play()
    print(music_player)
    time.sleep(1)
    # music_player.stop()
    print(music_player)
    time.sleep(1)
    music_player.next_track()
    print(music_player)
    time.sleep(5)
    # music_player.pause()
    print(music_player)


def create_players():
    music_player = ConsolePlayer()
    print(music_player)


if __name__ == "__main__":
    create_players()
    play_songs()
