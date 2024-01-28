import 'package:dio/dio.dart';
import 'package:client/src/utils/time_parser_converter.dart';
import 'package:client/src/widget/square_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:music_server_api/music_server_api.dart';

class SongEditForm extends StatefulWidget {
  const SongEditForm({super.key, required this.api, required this.song});

  final MusicServerApi api;
  final Song? song;

  @override
  State<SongEditForm> createState() => _SongEditFormState();
}

class _SongEditFormState extends State<SongEditForm> {
  final _formKey = GlobalKey<FormState>();

  // Values of the text field
  late String? title = widget.song?.title;
  late String? artist = widget.song?.artist;
  late num? duration = widget.song?.duration;
  late String? thumbnailFileName = widget.song?.thumbnailFileName;

  late SquareImage squareImage =
      SquareImage.fromSongId(songId: widget.song?.id);

  String? _durationValidator(String? value) {
    TimeParserConverter timeParserConverter =
        TimeParserConverter.fromString(value);
    duration = timeParserConverter.nrSeconds;
    return TimeParserConverter.validationError;
  }

  void submitAction() {
    Song newSong = Song((builder) => builder
      ..id = widget.song?.id ?? 0
      ..title = title
      ..artist = artist
      ..duration = duration
      ..thumbnailFileName = thumbnailFileName);

    if (widget.song == null) {
      widget.api.getDefaultApi().addSongsAddPost(song: newSong);
    } else {
      widget.api
          .getDefaultApi()
          .renameSongsSongIdPut(songId: widget.song!.id, song: newSong);
    }
  }

  Widget imageButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OutlinedButton(
          onPressed: () {
            thumbnailFileName = null;
            imageCache.clear();
            setState(() {
              squareImage =
                  SquareImage.fromFromFileName(fileName: thumbnailFileName);
            });
          },
          child: const Text("Remove image"),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          onPressed: () {
            imageCache.clear();
            _pickImage();
          },
          child: const Text('Pick image'),
        ),
      ],
    );
  }

  Future _pickImage() async {
    final XFile? selectedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    // Did not pick an image
    if (selectedImage == null) {
      return;
    }

    thumbnailFileName = selectedImage.name;
    MultipartFile multipartFile = MultipartFile.fromBytes(
      await selectedImage.readAsBytes(),
      filename: thumbnailFileName,
    );

    var response =
        await widget.api.getDefaultApi().createImagesPost(file: multipartFile);
    if (response.statusCode != 200) {
      print(response);
      return;
    }

    setState(() {
      squareImage = SquareImage.fromFromFileName(fileName: thumbnailFileName);
    });
  }

  Widget formButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OutlinedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Cancel"),
        ),
        const SizedBox(width: 10),
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
          child: Text(widget.song == null ? 'Create' : 'Save'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(flex: 1, child: squareImage),
          const SizedBox(height: 8),
          imageButtons(context),
          TextFormField(
            initialValue: title,
            decoration: const InputDecoration(
              isDense: true,
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
              isDense: true,
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
              isDense: true,
              hintText: "HH:MM:SS",
              labelText: 'Song duration',
            ),
            keyboardType: TextInputType.datetime,
            validator: _durationValidator,
          ),
          const SizedBox(height: 8),
          formButtons(context),
        ],
      ),
    );
  }
}
