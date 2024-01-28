import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:client/src/utils/time_parser_converter.dart';
import 'package:client/src/widget/square_image.dart';
import 'package:client/src/utils/websocket_manager.dart';
import 'package:flutter/material.dart';
import 'package:music_server_api/music_server_api.dart';

import '../settings/settings_view.dart';

/// Displays the queue.
class QueueView extends StatefulWidget {
  const QueueView(
      {super.key, required this.api, required this.webSocketManager});

  static const routeName = '/queue';
  static const titleName = "Queue";
  final MusicServerApi api;
  final WebSocketManager webSocketManager;

  @override
  State<QueueView> createState() => _QueueViewState();
}

class _QueueViewState extends State<QueueView> {
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

        // We want to check if our queue is already the same order, if so don't update
        if (queue.length == this.queue.length) {
          bool isEqual = true;
          for (int i = 0; i < queue.length; i++) {
            if (queue[i].id != this.queue[i].id) {
              isEqual = false;
              break;
            }
          }

          // Received broadcast queue was equal to internal queue
          if (isEqual) {
            return;
          }
        }

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

  void moveSong(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex--;
    }

    Song song = queue.removeAt(oldIndex);
    queue.insert(newIndex, song);

    // Item moved
    setState(() => {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(QueueView.titleName),
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
      body: ReorderableListView.builder(
        buildDefaultDragHandles: !deleting,
        onReorder: (oldIndex, newIndex) {
          moveSong(oldIndex, newIndex);
          widget.api
              .getDefaultApi()
              .moveQueueIndexNewIndexPut(index: oldIndex, newIndex: newIndex);
        },
        itemCount: queue.length,
        itemBuilder: (BuildContext context, int index) {
          final song = queue[index];
          return ListTile(
            contentPadding: const EdgeInsets.only(left: 16),
            key: ValueKey(index),
            dense: true,
            title: Text(song.title),
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
                        color: Colors.transparent,
                      ),
              ],
            ),
          );
        },
      ),
    );
  }
}
