import 'package:flutter/material.dart';
import 'package:music_server_api/music_server_api.dart';

import '../settings/settings_view.dart';
import 'song_view.dart';

/// Displays a list of SongItems.
class SongListView extends StatefulWidget {
  const SongListView({
    super.key,
    required this.api,
  });

  static const routeName = '/';
  final DefaultApi api;

  @override
  State<SongListView> createState() => _SongListViewState();
}

class _SongListViewState extends State<SongListView> {
  late List<Song> songs = [];

  @override
  void initState() {
    super.initState();
    loadSongs();
  }

  Future<void> loadSongs() async {
    final currentSongs = await getSongs();
    setState(() {
      songs = currentSongs;
    });
  }

  Future<List<Song>> getSongs() async {
    final response = await widget.api.songsSongsGet();

    if (response.statusCode != 200) {
      return List.empty();
    }

    return response.data!.toList();
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
