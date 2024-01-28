import 'dart:async';
import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:client/src/utils/time_parser_converter.dart';
import 'package:client/src/utils/websocket_manager.dart';
import 'package:client/src/widget/square_image.dart';
import 'package:flutter/material.dart';
import 'package:music_server_api/music_server_api.dart';

import '../settings/settings_view.dart';
import 'song_edit_view.dart';

/// Displays a list of SongItems.
class LibraryView extends StatefulWidget {
  const LibraryView(
      {super.key, required this.api, required this.webSocketManager});

  static const routeName = '/songs';
  static const titleName = "Library";
  final MusicServerApi api;
  final WebSocketManager webSocketManager;

  @override
  State<LibraryView> createState() => _LibraryViewState();
}

class _LibraryViewState extends State<LibraryView> {
  late List<Song> songs = [];
  bool editing = false;

  late StreamSubscription _subscription;

  @override
  void initState() {
    super.initState();

    widget.api.getDefaultApi().songsSongsGet().then((value) {
      setState(() {
        songs = value.data!.toList();
      });
    });

    _subscription = widget.webSocketManager.messageStream.listen((message) {
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

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  void _toggleEdit() {
    setState(() {
      editing = !editing;
    });
  }

  List<Widget> _getItemButtons(Song song) {
    Container durationContainer = Container(
      alignment: AlignmentDirectional.centerEnd,
      constraints: const BoxConstraints(minWidth: 30),
      child: Text(TimeParserConverter(song.duration).toString()),
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
            widget.api.getDefaultApi().removeSongsSongIdDelete(songId: song.id);
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
        title: const Text(LibraryView.titleName),
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
      // Builder since this can change on the fly, the items are not immutable
      body: ListView.builder(
        itemCount: songs.length,
        itemBuilder: (BuildContext context, int index) {
          Song song = songs[index];
          return ListTile(
            contentPadding: const EdgeInsets.only(
                left: 16, right: 12), // To align the icons!
            dense: true,
            title: Text(song.title),
            subtitle: Text(song.artist),
            leading: SquareImage.fromSongId(songId: song.id),
            trailing: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: _getItemButtons(song),
            ),
            onTap: () {
              if (!editing) {
                widget.api.getDefaultApi().addQueueSongIdPost(songId: song.id);
              }
            },
          );
        },
      ),
    );
  }
}
