import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:client/src/common.dart';
import 'package:client/src/connection/websocket_manager.dart';
import 'package:flutter/material.dart';
import 'package:music_server_api/music_server_api.dart';
import 'dart:convert';

import '../settings/settings_view.dart';

/// Displays detailed information about a SongItem.
class PlayerView extends StatefulWidget {
  const PlayerView(
      {super.key, required this.api, required this.webSocketManager});

  static const routeName = '/player';
  final MusicServerApi api;
  final WebSocketManager webSocketManager;

  @override
  State<PlayerView> createState() => _PlayerViewState();
}

class _PlayerViewState extends State<PlayerView> {
  ConsolePlayer consolePlayer = ConsolePlayer((b) => b
    ..state = PlayerState.STOPPED
    ..songPosition = 0.0);

  // Define a variable to hold the timer
  late Timer _sliderTimer;
  num currentSongPosition = 0;

  @override
  void initState() {
    super.initState();

    widget.api.getDefaultApi().playerPlayerGet().then((value) {
      setState(() {
        consolePlayer = value.data!;
        currentSongPosition = consolePlayer.songPosition;
      });
    });

    _sliderTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      // Do not update the state in these cases
      if (consolePlayer.currentSong == null) {
        return;
      } else if (consolePlayer.state != PlayerState.PLAYING) {
        return;
      }

      num newSongPosition = min(
          currentSongPosition + 1, consolePlayer.currentSong?.duration ?? 0);

      setState(() {
        currentSongPosition = newSongPosition;
      });
    });

    widget.webSocketManager.messageStream.listen((message) {
      var parsedMessage = json.decode(message);
      if (parsedMessage["player"] == null) {
        return;
      }

      var playerData = parsedMessage["player"];

      ConsolePlayer consolePlayer = widget.api.serializers.fromJson(
          widget.api.serializers.serializerForType(ConsolePlayer)!, playerData);

      setState(() {
        this.consolePlayer = consolePlayer;
        currentSongPosition = consolePlayer.songPosition;
      });
    });
  }

  // Don't forget to cancel the timer when the widget is disposed
  @override
  void dispose() {
    _sliderTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Player view'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Scaffold(
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.symmetric(
                            horizontal: 15, vertical: 5),
                        child: Center(
                            child: Image.file(File(
                                "C:/Users/gerard/Pictures/Rapunzel_Pascal.png"))
                            // Image.network(metadata.artUri.toString()),
                            ),
                      ),
                    ),
                    Text(
                      consolePlayer.currentSong?.title ?? "[Title placeholder]",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    // When the text isnt immediately fetched it has a temporary value
                    Text(consolePlayer.currentSong?.title ??
                        "[Artist placeholder]")
                  ],
                ),
              ),
            ),
            Slider(
                min: 0,
                max: consolePlayer.currentSong?.duration.toDouble() ?? 0,
                value: currentSongPosition.toDouble(),
                onChanged: (value) {
                  // Note: Cannot set position for LP
                }),
            Container(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(secondsString(currentSongPosition)),
                  Text(secondsString(
                      consolePlayer.currentSong?.duration.toInt() ?? 0)),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Builder(
                  builder: (context) {
                    if (consolePlayer.state == PlayerState.PLAYING) {
                      return IconButton(
                          icon: const Icon(Icons.pause),
                          onPressed: widget.api
                              .getDefaultApi()
                              .pausePlayerActionsPauseGet);
                    } else {
                      return IconButton(
                          icon: const Icon(Icons.play_arrow),
                          onPressed: widget.api
                              .getDefaultApi()
                              .playPlayerActionsPlayGet);
                    }
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.skip_next),
                  onPressed: widget.api
                      .getDefaultApi()
                      .nextTrackPlayerActionsNextTrackGet,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
