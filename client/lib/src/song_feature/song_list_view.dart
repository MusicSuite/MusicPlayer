import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:client/src/common.dart';
import 'package:client/src/utils/websocket_manager.dart';
import 'package:flutter/material.dart';
import 'package:music_server_api/music_server_api.dart';

import '../settings/settings_view.dart';
import 'song_edit_view.dart';

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
  bool editing = false;

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

        setState(() {
          this.songs = songs.toList();
        });
      }
    });
  }

  void _toggleEdit() {
    setState(() {
      editing = !editing;
    });
  }

  List<Widget> _getItemButtons(Song song) {
    Container durationContainer = Container(
      alignment: AlignmentDirectional.centerEnd,
      constraints: const BoxConstraints(minWidth: 40),
      child: Text(secondsString(song.duration)),
    );

    if (!editing) {
      return [durationContainer];
    }

    List<Widget> items = [
      IconButton(
          onPressed: () {
            Navigator.restorablePushNamed(
              context,
              SongEditView.routeName,
              arguments: song.id,
            );
          },
          icon: const Icon(Icons.edit)),
      IconButton(
          onPressed: () {
            widget.api
                .getDefaultApi()
                .removeSongsSongIdRemoveDelete(songId: song.id);
          },
          icon: const Icon(Icons.delete)),
      durationContainer,
    ];

    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Songs'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.restorablePushNamed(
                context,
                SongEditView.routeName,
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: _toggleEdit,
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),
      body: ListView(
        restorationId: 'songItemListView',
        children: [
          for (Song song in songs)
            ListTile(
              dense: true,
              title: Text("${song.title} (id=${song.id})"),
              subtitle: const Text("[Artist placeholder]"),
              leading: const CircleAvatar(
                foregroundImage: AssetImage('assets/images/flutter_logo.png'),
              ),
              trailing: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: _getItemButtons(song),
              ),
              onTap: () {
                if (!editing) {
                  widget.api
                      .getDefaultApi()
                      .addQueueSongIdPost(songId: song.id);
                }
              },
            )
        ],
      ),
    );
  }
}
