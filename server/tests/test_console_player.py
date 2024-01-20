import random
import time
import unittest

from src.model.playerstate import PlayerState
from src.model.song import Song
from src.player.console_player import ConsolePlayer
from tests.utils.constants import SONGS


class TestConsolePlayer(unittest.TestCase):
    console_player: ConsolePlayer = None

    def setUp(self):
        self.console_player = ConsolePlayer()

    def tearDown(self):
        self.console_player.stop()

    def test_init(self):
        self.assertIsNone(self.console_player.current_song)

    def _add_song(self, song_index: int) -> Song:
        if SONGS[song_index].duration < 4:
            SONGS[song_index].duration = 4

        self.console_player.queue.add(SONGS[song_index])
        return SONGS[song_index]

    async def test_play_song(self):
        song_index = random.choice(range(len(SONGS)))
        song = self._add_song(song_index)
        self.assertIsNone(self.console_player.current_song)
        self.console_player.play()
        self.assertEqual(PlayerState.PLAYING, self.console_player.state)
        self.assertEqual(song, self.console_player.current_song)
        time.sleep(3)
        self.assertGreaterEqual(self.console_player.song_position, 2)
        self.assertEqual(0, len(self.console_player.queue))

    async def test_pause_song(self):
        song_index = random.choice(range(len(SONGS)))
        song = self._add_song(song_index)
        self.console_player.play()
        self.console_player.pause()
        self.assertEqual(PlayerState.PAUSED, self.console_player.state)
        self.assertEqual(song, self.console_player.current_song)

    async def test_stop_song(self):
        song_index = random.choice(range(len(SONGS)))
        self._add_song(song_index)
        self.console_player.play()
        self.console_player.stop()
        self.assertEqual(PlayerState.STOPPED, self.console_player.state)
        self.assertIsNone(self.console_player.current_song)

    async def test_next_song(self):
        song_indices = random.sample(range(len(SONGS)), 2)
        self._add_song(song_indices[0])
        self._add_song(song_indices[1])
        self.console_player.play()
        self.console_player.next_track()
        self.assertEqual(SONGS[song_indices[-1]], self.console_player.current_song)
        self.assertEqual(PlayerState.PLAYING, self.console_player.state)
        time.sleep(3)
        self.assertGreaterEqual(self.console_player.song_position, 2)

    async def test_stop_song_stops_timer(self):
        song_index = random.choice(range(len(SONGS)))
        self._add_song(song_index)
        self.console_player.play()
        time.sleep(3)
        self.console_player.stop()
        song_position = self.console_player.song_position
        self.assertNotEqual(0, song_position)
        time.sleep(3)
        self.assertEqual(song_position, self.console_player.song_position)
