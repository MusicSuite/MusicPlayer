import 'package:client/src/utils/time_parser_converter.dart';
import 'package:client/src/widget/square_image.dart';
import 'package:flutter/material.dart';
import 'package:music_server_api/music_server_api.dart';

class SongEditForm extends StatelessWidget {
  SongEditForm({super.key, required this.api, required this.song});

  final MusicServerApi api;
  final Song? song;

  final _formKey = GlobalKey<FormState>();

  // Values of the text field
  late String? title = song?.title;
  late String? artist = song?.artist;
  late num? duration = song?.duration;
  late String? thumbnailFileName = song?.thumbnailFileName;

  String? _durationValidator(String? value) {
    TimeParserConverter timeParserConverter =
        TimeParserConverter.fromString(value);
    duration = timeParserConverter.nrSeconds;
    return TimeParserConverter.validationError;
  }

  void submitAction() {
    Song newSong = $Song((builder) => builder
      ..id = song?.id ?? 0
      ..title = title
      ..duration = duration);

    if (song == null) {
      api.getDefaultApi().addSongsAddPost(song: newSong);
    } else {
      api
          .getDefaultApi()
          .renameSongsSongIdReplacePut(songId: song!.id, song: newSong);
    }
  }

  Widget formButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
              submitAction();
              Navigator.pop(context);
            },
            child: Text(song == null ? 'Create' : 'Save'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsetsDirectional.symmetric(vertical: 5),
              child: SquareImage(thumbnailFileName),
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
            initialValue: artist,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Song artist',
            ),
            onSaved: (newValue) => artist = newValue,
            validator: (value) =>
                value?.isEmpty == true ? "Artist required" : null,
          ),
          TextFormField(
            initialValue: TimeParserConverter(duration).toString(),
            decoration: const InputDecoration(
              hintText: "HH:MM:SS",
              labelText: 'Song duration',
            ),
            keyboardType: TextInputType.datetime,
            validator: _durationValidator,
          ),
          formButtons(context),
        ],
      ),
    );
  }
}
