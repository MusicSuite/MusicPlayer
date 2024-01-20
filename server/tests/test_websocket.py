import unittest

from fastapi.testclient import TestClient
from src.main import create_app
from src.model.websocket_message_type import WebSocketMessageType
from src.player.console_player import console_player as music_player
from src.utils import json_loader


class TestWebSocket(unittest.TestCase):
    client: TestClient

    def setUp(self):
        self.client = TestClient(create_app())

    @staticmethod
    def create_update_json(updates: [WebSocketMessageType]):
        return dict({"updated": updates})

    def test_queue_response(self):
        with self.client.websocket_connect("/ws") as websocket:
            websocket.send_json(self.create_update_json([WebSocketMessageType.Queue.value]))
            response = websocket.receive_json()
            self.assertEqual(music_player.queue.model_dump_json(), response[WebSocketMessageType.Queue.value])

    def test_songs_response(self):
        with self.client.websocket_connect("/ws") as websocket:
            websocket.send_json(self.create_update_json([WebSocketMessageType.Songs.value]))
            response = websocket.receive_json()
            self.assertEqual(json_loader.get_songs_json(), response[WebSocketMessageType.Songs.value])

    def test_player_response(self):
        with self.client.websocket_connect("/ws") as websocket:
            websocket.send_json(self.create_update_json([WebSocketMessageType.Player.value]))
            response = websocket.receive_json()
            self.assertEqual(music_player.model_dump_json(), response[WebSocketMessageType.Player.value])

    def test_multiple_updates(self):
        with self.client.websocket_connect("/ws") as websocket:
            websocket.send_json(self.create_update_json([WebSocketMessageType.Player.value, WebSocketMessageType.Queue.value]))
            response = websocket.receive_json()
            self.assertEqual(music_player.model_dump_json(), response[WebSocketMessageType.Player.value])
            self.assertEqual(music_player.queue.model_dump_json(), response[WebSocketMessageType.Queue.value])

    def test_broadcast(self):
        with self.client.websocket_connect("/ws") as websocket1:
            with self.client.websocket_connect("/ws") as websocket2:
                websocket1.send_json(self.create_update_json([WebSocketMessageType.Player.value]))
                response1 = websocket1.receive_json()
                response2 = websocket2.receive_json()
                self.assertEqual(response1, response2)

    def test_unknown_action(self):
        with self.client.websocket_connect("/ws") as websocket:
            websocket.send_json(self.create_update_json([]))
            response = websocket.receive_json()
            self.assertEqual(dict(), response)
