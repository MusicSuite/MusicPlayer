import random
import unittest

from src.utils import json_loader
from tests.utils.constants import SONGS


class TestJsonLoader(unittest.TestCase):
    def setUp(self):
        json_loader._write_songs_to_json(SONGS)

    def tearDown(self):
        json_loader._write_songs_to_json(SONGS)

    def test_read_from_json(self):
        song_index = random.choice(range(len(SONGS)))
        json_loader._write_songs_to_json([SONGS[song_index]])
        loaded_songs = json_loader.get_songs()
        self.assertEqual(SONGS[song_index], loaded_songs[0])

    def test_get_song(self):
        song_index = random.choice(range(len(SONGS)))
        song = json_loader.get_song(SONGS[song_index].id)
        self.assertEqual(SONGS[song_index], song)

    def test_add_song(self):
        song_index = random.choice(range(len(SONGS)))
        json_loader.add_song(SONGS[song_index])
        loaded_songs = json_loader.get_songs()
        self.assertEqual(len(SONGS) + 1, len(loaded_songs))

        original_song_ids = set([song.id for song in SONGS])
        new_songs = [song for song in loaded_songs if not original_song_ids.__contains__(song.id)]
        self.assertEqual(len(new_songs), 1)
        new_song = new_songs[0]
        self.assertNotEqual(new_song.id, SONGS[song_index].id)
        self.assertEqual(new_song.title, SONGS[song_index].title)

    def test_remove_song(self):
        song_index = random.choice(range(len(SONGS)))
        json_loader.remove_song(SONGS[song_index].id)
        loaded_songs = json_loader.get_songs()
        self.assertEqual(len(SONGS) - 1, len(loaded_songs))

        original_song_ids = set([song.id for song in SONGS])
        current_song_ids = set([song.id for song in loaded_songs])
        removed_song_ids = original_song_ids - current_song_ids
        self.assertEqual(1, len(removed_song_ids))
        self.assertEqual(SONGS[song_index].id, removed_song_ids.pop())
