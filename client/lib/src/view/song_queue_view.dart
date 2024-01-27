import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:client/src/utils/time_parser_converter.dart';
import 'package:client/src/widget/square_image.dart';
import 'package:client/src/utils/websocket_manager.dart';
import 'package:flutter/material.dart';
import 'package:music_server_api/music_server_api.dart';

import '../settings/settings_view.dart';

/// Displays the queue.
class SongQueueView extends StatefulWidget {
  const SongQueueView(
      {super.key, required this.api, required this.webSocketManager});

  static const routeName = '/';
  final MusicServerApi api;
  final WebSocketManager webSocketManager;

  @override
  State<SongQueueView> createState() => _SongQueueViewState();
}

class _SongQueueViewState extends State<SongQueueView> {
  late List<Song> queue = [];
  bool deleting = false;

  @override
  void initState() {
    super.initState();

    widget.api.getDefaultApi().queueQueueGet().then((value) {
      setState(() {
        queue = value.data!.toList();
      });
    });

    widget.webSocketManager.messageStream.listen((message) {
      var parsedMessage = json.decode(message);

      if (parsedMessage is Map<String, dynamic> &&
          parsedMessage.containsKey("queue")) {
        List<dynamic> songsJson = parsedMessage["queue"];
        BuiltList<Song> queue = BuiltList<Song>.from(
          songsJson.map((songJson) => widget.api.serializers
              .deserializeWith(Song.serializer, songJson)),
        );

        setState(() {
          this.queue = queue.toList();
        });
      }
    });
  }

  void _toggleDelete() {
    setState(() {
      deleting = !deleting;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Queue'),
        actions: [
          IconButton(
            icon: Icon(deleting ? Icons.drag_handle : Icons.remove_from_queue),
            onPressed: _toggleDelete,
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),
      body: ReorderableListView(
        restorationId: 'songQueueItemListView',
        buildDefaultDragHandles: !deleting,
        onReorder: (oldIndex, newIndex) {
          widget.api
              .getDefaultApi()
              .moveQueueIndexNewIndexPut(index: oldIndex, newIndex: newIndex);
        },
        children: List.from(
          queue.asMap().entries.map(
            (entry) {
              final index = entry.key;
              final song = entry.value;
              return ListTile(
                contentPadding:
                    const EdgeInsets.only(left: 16), // To allign the icons!
                key: ValueKey(index),
                dense: true,
                title: Text("${song.title} (id=${song.id})"),
                subtitle: Text(song.artist),
                leading: SquareImage.fromSongId(songId: song.id),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(TimeParserConverter(song.duration).toString()),
                    deleting
                        ? IconButton(
                            onPressed: () {
                              widget.api
                                  .getDefaultApi()
                                  .removeQueueIndexDelete(index: index);
                            },
                            icon: const Icon(Icons.remove_from_queue),
                          )
                        : IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.circle),
                            color: Colors.transparent),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
