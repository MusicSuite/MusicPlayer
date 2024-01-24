// Create a Form widget.
import 'dart:io';

import 'package:client/src/common.dart';
import 'package:client/src/song_feature/song_list_view.dart';
import 'package:flutter/material.dart';
import 'package:music_server_api/music_server_api.dart';

class SongEditForm extends StatelessWidget {
  SongEditForm({super.key, required this.api, required this.song});

  final MusicServerApi api;
  final Song? song;
  final _formKey = GlobalKey<FormState>();

  String? _durationValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Must contain a value";
    }

    List<String> input = value.split(":");
    if (input.length > 3) {
      return "Only hours, minutes, and seconds";
    }

    List<int?> maybeNumbers = input
        .map((e) => int.tryParse(e))
        .map((e) => e != null && e < 0 ? null : e)
        .toList();

    if (maybeNumbers.any((element) => element == null)) {
      return "Please only use numeric characters and :";
    }

    List<int> numbers = maybeNumbers.map((e) => e!).toList().reversed.toList();

    int hours = numbers.length > 2 ? numbers[2] : 0;
    int minutes = numbers.length > 1 ? numbers[1] : 0;
    int seconds = numbers[0];
    if (seconds > 59) {
      return "Seconds is wrong";
    }
    if (minutes > 59) {
      return "Minutes is wrong";
    }

    duration =
        Duration(hours: hours, minutes: minutes, seconds: seconds).inSeconds;
    return null;
  }

  late String? title = song?.title;
  late num? duration = song?.duration;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsetsDirectional.symmetric(vertical: 5),
              child: Center(
                  child: Image.file(
                      File("C:/Users/gerard/Pictures/Rapunzel_Pascal.png"))
                  // Image.network(metadata.artUri.toString()),
                  ),
            ),
          ),
          TextFormField(
            initialValue: title,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Song title',
            ),
            onSaved: (newValue) => title = newValue,
            validator: (value) =>
                value?.isEmpty == true ? "Title required" : null,
          ),
          TextFormField(
            initialValue: title,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Song artist',
            ),
            // TODO: onSaved: (newValue) => title = newValue,
            validator: (value) =>
                value?.isEmpty == true ? "Artist required" : null,
          ),
          TextFormField(
            initialValue: duration == null ? "" : secondsString(duration!),
            decoration: const InputDecoration(
              hintText: "HH:MM:SS",
              labelText: 'Song duration',
            ),
            keyboardType: TextInputType.datetime,
            validator: _durationValidator,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Cancel"),
              ),
              const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
              ElevatedButton(
                onPressed: () {
                  // One or more of the fields are invalid
                  if (!_formKey.currentState!.validate()) {
                    return;
                  }

                  // Save, so we have the newest values
                  _formKey.currentState!.save();

                  Song newSong = $Song((b) => b
                    ..id = song?.id ?? 0
                    ..title = title
                    ..duration = duration);

                  if (song == null) {
                    api.getDefaultApi().addSongsAddPost(song: newSong);
                  } else {
                    api.getDefaultApi().renameSongsSongIdReplacePut(
                        songId: song!.id, song: newSong);
                  }

                  Navigator.pop(context);
                },
                child: Text(song == null ? 'Create' : 'Save'),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
