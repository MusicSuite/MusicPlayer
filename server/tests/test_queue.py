import random
import unittest

from src.utils.music_queue import MusicQueue
from tests.utils.constants import SONGS


class TestQueue(unittest.TestCase):
    queue: MusicQueue = None

    def setUp(self):
        self.queue = MusicQueue()

    def test_get(self):
        self.assertTrue(self.queue.is_empty())
        for i in range(len(SONGS)):
            self.queue.add(SONGS[i])

        self.assertEqual(len(SONGS), len(self.queue))
        for i in range(len(SONGS)):
            song = self.queue.get()
            self.assertEqual(SONGS[i], song)
            self.assertEqual(len(SONGS) - 1 - i, len(self.queue))

    def test_add(self):
        self.assertTrue(self.queue.is_empty())
        nr_songs = random.randint(1, len(SONGS))
        for i in range(nr_songs):
            self.queue.add(SONGS[i])
            self.assertEqual(SONGS[i], self.queue.queue[-1])

        self.assertEqual(nr_songs, len(self.queue), "Length of queue equals number of songs added")

    def test_is_empty(self):
        self.assertTrue(self.queue.is_empty())
        self.queue.add(SONGS[0])
        self.assertFalse(self.queue.is_empty())
