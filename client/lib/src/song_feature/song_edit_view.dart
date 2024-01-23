import 'dart:io';

import 'package:client/src/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_picker/picker.dart';
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
  Future<Song> fetchSongDetails(int songId) async {
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
        title: const Text('Detailed view'),
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
        future: fetchSongDetails(0),
        // fetchSongDetails(ModalRoute.of(context)?.settings.arguments as int),
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.symmetric(
                                  vertical: 5),
                              child: Center(
                                  child: Image.file(File(
                                      "C:/Users/gerard/Pictures/Rapunzel_Pascal.png"))
                                  // Image.network(metadata.artUri.toString()),
                                  ),
                            ),
                          ),
                          TextFormField(
                            initialValue: snapshot.data?.title,
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Song title',
                            ),
                          ),
                          TextFormField(
                            initialValue: snapshot.data?.title,
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Song artist',
                            ),
                          ),
                          TextFormField(
                            initialValue: snapshot.data == null
                                ? null
                                : secondsString(snapshot.data!.duration),
                            decoration: const InputDecoration(
                              labelText: 'Duration (HH:MM:SS)',
                            ),
                            keyboardType: TextInputType.datetime,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Must contain a value";
                              }

                              List<String>? input = value?.split(":");
                              if (input == null) {
                                return "Please enter a valid duration";
                              }

                              if (input.length > 3) {
                                return "Only hours, minutes, and seconds";
                              }

                              List<int?> maybeNumbers = input
                                  .map((e) => int.tryParse(e))
                                  .map((e) => e != null && e < 0 ? null : e)
                                  .toList();

                              if (maybeNumbers
                                  .any((element) => element == null)) {
                                return "Please only use valid characters";
                              }

                              List<int> numbers =
                                  maybeNumbers.map((e) => e!).toList();

                              if (numbers.length > 1 && numbers[0] > 59) {
                                return "Seconds is wrong";
                              }
                              if (numbers.length > 2 && numbers[1] > 59) {
                                return "Minutes is wrong";
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
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
