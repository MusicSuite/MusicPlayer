import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:client/src/connection/websocket_manager.dart';
import 'package:flutter/material.dart';
import 'package:music_server_api/music_server_api.dart';

import '../settings/settings_view.dart';
import 'song_view.dart';

/// Displays a list of SongItems.
class SongListView extends StatefulWidget {
  const SongListView(
      {super.key, required this.api, required this.webSocketManager});

  static const routeName = '/';
  final MusicServerApi api;
  final WebSocketManager webSocketManager;

  @override
  State<SongListView> createState() => _SongListViewState();
}

class _SongListViewState extends State<SongListView> {
  late List<Song> songs = [];

  @override
  void initState() {
    super.initState();

    widget.api.getDefaultApi().songsSongsGet().then((value) {
      setState(() {
        songs = value.data!.toList();
      });
    });

    widget.webSocketManager.messageStream.listen((message) {
      var parsedMessage = json.decode(message);

      if (parsedMessage is Map<String, dynamic> &&
          parsedMessage.containsKey("songs")) {
        List<dynamic> songsJson = parsedMessage["songs"];
        BuiltList<Song> songs = BuiltList<Song>.from(
          songsJson.map((songJson) => widget.api.serializers
              .deserializeWith(Song.serializer, songJson)),
        );

        print(songs);

        setState(() {
          this.songs = songs.toList();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Songs'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),
      body: ListView.builder(
        restorationId: 'songItemListView',
        itemCount: songs.length,
        itemBuilder: (BuildContext context, int index) {
          final song = songs[index];

          return ListTile(
            title: Text("${song.title} (id=${song.id})"),
            leading: const CircleAvatar(
              foregroundImage: AssetImage('assets/images/flutter_logo.png'),
            ),
            onTap: () {
              Navigator.restorablePushNamed(
                context,
                SongView.routeName,
                arguments: song.id,
              );
            },
          );
        },
      ),
    );
  }
}
