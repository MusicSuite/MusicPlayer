import 'package:flutter/material.dart';
import 'package:music_server_api/music_server_api.dart';

import '../settings/settings_view.dart';

/// Displays detailed information about a SongItem.
class SongView extends StatelessWidget {
  const SongView({super.key, required this.api});

  static const routeName = '/song';
  final MusicServerApi api;

  Future<Song> fetchSongDetails(int songId) async {
    var response = await api.getDefaultApi().songSongsSongIdGet(songId: songId);

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
        future:
            fetchSongDetails(ModalRoute.of(context)?.settings.arguments as int),
        builder: (context, snapshot) {
          return SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Scaffold(
                    body: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Center(
                                // child:
                                //     Image.network(metadata.artUri.toString()),
                                ),
                          ),
                        ),
                        Text(
                          "TestText",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        // When the text isnt immediately fetched it has a temporary value
                        Text(snapshot.data?.title ?? "Unknown title")
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );

    // ControlButtons(_player),
    // StreamBuilder<PositionData>(
    //   stream: _positionDataStream,
    //   builder: (context, snapshot) {
    //     final positionData = snapshot.data;
    //     return SeekBar(
    //       duration: positionData?.duration ?? Duration.zero,
    //       position: positionData?.position ?? Duration.zero,
    //       bufferedPosition:
    //           positionData?.bufferedPosition ?? Duration.zero,
    //       onChangeEnd: (newPosition) {
    //         _player.seek(newPosition);
    //       },
    //     );
    //   },
    // ),
    // const SizedBox(height: 8.0),
    // Row(
    //   children: [
    //     StreamBuilder<LoopMode>(
    //       stream: _player.loopModeStream,
    //       builder: (context, snapshot) {
    //         final loopMode = snapshot.data ?? LoopMode.off;
    //         const icons = [
    //           Icon(Icons.repeat, color: Colors.grey),
    //           Icon(Icons.repeat, color: Colors.orange),
    //           Icon(Icons.repeat_one, color: Colors.orange),
    //         ];
    //         const cycleModes = [
    //           LoopMode.off,
    //           LoopMode.all,
    //           LoopMode.one,
    //         ];
    //         final index = cycleModes.indexOf(loopMode);
    //         return IconButton(
    //           icon: icons[index],
    //           onPressed: () {
    //             _player.setLoopMode(cycleModes[
    //                 (cycleModes.indexOf(loopMode) + 1) %
    //                     cycleModes.length]);
    //           },
    //         );
    //       },
    //     ),
    //     Expanded(
    //       child: Text(
    //         "Playlist",
    //         style: Theme.of(context).textTheme.titleLarge,
    //         textAlign: TextAlign.center,
    //       ),
    //     ),
    //     StreamBuilder<bool>(
    //       stream: _player.shuffleModeEnabledStream,
    //       builder: (context, snapshot) {
    //         final shuffleModeEnabled = snapshot.data ?? false;
    //         return IconButton(
    //           icon: shuffleModeEnabled
    //               ? const Icon(Icons.shuffle, color: Colors.orange)
    //               : const Icon(Icons.shuffle, color: Colors.grey),
    //           onPressed: () async {
    //             final enable = !shuffleModeEnabled;
    //             if (enable) {
    //               await _player.shuffle();
    //             }
    //             await _player.setShuffleModeEnabled(enable);
    //           },
    //         );
    //       },
    //     ),
    //   ],
    // ),
    // ],
    //     ),
    //   ),
    // );
  }
}
