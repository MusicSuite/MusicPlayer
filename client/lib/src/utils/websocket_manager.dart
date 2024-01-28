import 'dart:async';
import 'dart:convert';

import 'package:client/src/common.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketManager {
  late WebSocketChannel _channel;
  late StreamController<String> _streamController;
  late bool _isConnected;

  WebSocketManager() {
    _isConnected = false;
    _streamController = StreamController<String>.broadcast();
    _connectToWebSocket();
  }

  void _connectToWebSocket() {
    _channel = WebSocketChannel.connect(Uri.parse('$wsServerURL/ws'));

    _channel.stream.listen(
      (message) {
        _streamController.add(message);
      },
      onDone: () {
        _handleConnectionClosed();
      },
      onError: (error) {
        print('WebSocket Error: $error');
        _handleConnectionClosed();
      },
    );

    _isConnected = true;
  }

  void _handleConnectionClosed() {
    if (!_isConnected) {
      return;
    }

    _isConnected = false;
    // _streamController.addError('Connection lost');

    Future.delayed(const Duration(seconds: 5), () {
      _connectToWebSocket();
      _requestStateUpdate();
    });
  }

  void _requestStateUpdate() {
    Map<String, dynamic> customMessage = {
      'updated': ['queue', 'songs', 'player']
    };
    String jsonMessage = jsonEncode(customMessage);
    _channel.sink.add(jsonMessage);
  }

  Stream<String> get messageStream => _streamController.stream;

  void dispose() {
    _channel.sink.close();
    _streamController.close();
  }
}
