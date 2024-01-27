import 'package:client/src/widget/song_edit_form.dart';
import 'package:flutter/material.dart';
import 'package:music_server_api/music_server_api.dart';

import '../settings/settings_view.dart';

/// Displays detailed information about a SongItem.
class SongEditView extends StatefulWidget {
  const SongEditView({super.key, required this.api});

  static const routeName = '/song';
  final MusicServerApi api;

  @override
  State<SongEditView> createState() => _SongEditViewState();
}

class _SongEditViewState extends State<SongEditView> {
  Future<Song?> fetchSongDetails(int? songId) async {
    if (songId == null) {
      return null;
    }

    var response =
        await widget.api.getDefaultApi().songSongsSongIdGet(songId: songId);

    if (response.statusCode != 200) {
      throw Exception("Song not found");
    }

    return response.data!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ModalRoute.of(context)?.settings.arguments == null
            ? "Create new song"
            : "Edit song"),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: fetchSongDetails(
            ModalRoute.of(context)?.settings.arguments as int?),
        builder: (buildContext, snapshot) {
          return SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Scaffold(
                    body: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child:
                            SongEditForm(api: widget.api, song: snapshot.data)),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
