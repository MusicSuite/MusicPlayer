import 'package:flutter/material.dart';
import 'package:music_server_api/music_server_api.dart';

import '../settings/settings_view.dart';

/// Displays detailed information about a SongItem.
class PlayerView extends StatelessWidget {
  const PlayerView({super.key, required this.api});

  static const routeName = '/player';
  final DefaultApi api;

  Future<ConsolePlayer> fetchPlayerState() async {
    var response = await api.playerPlayerGet();

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
        future: fetchPlayerState(),
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
                          snapshot.data?.currentSong?.title ?? "Unknown title",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        // When the text isnt immediately fetched it has a temporary value
                        Text(snapshot.data?.currentSong?.title ??
                            "Unknown title")
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // IconButton(
                    //   icon: const Icon(Icons.volume_up),
                    //   onPressed: () {
                    //     showSliderDialog(
                    //       context: context,
                    //       title: "Adjust volume",
                    //       divisions: 10,
                    //       min: 0,
                    //       max: 100,
                    //       // stream: player.volumeStream,
                    //       onChanged: player.setVolume,
                    //     );
                    //   },
                    // ),
                    // IconButton(
                    //   icon: const Icon(Icons.skip_previous),
                    //   onPressed: () => print("Previous pressed"),
                    // ),
                    Builder(
                      builder: (context) {
                        if (snapshot.data?.state == PlayerState.PLAYING) {
                          return IconButton(
                              icon: const Icon(Icons.pause),
                              onPressed: api.pausePlayerActionsPauseGet);
                        } else {
                          return IconButton(
                              icon: const Icon(Icons.play_arrow),
                              onPressed: api.playPlayerActionsPlayGet);
                        }
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.skip_next),
                      onPressed: () => api.nextTrackPlayerActionsNextTrackGet(),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
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

// class ControlButtons extends StatelessWidget {
//   final AudioPlayer player;

//   const ControlButtons({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         IconButton(
//           icon: const Icon(Icons.volume_up),
//           onPressed: () {
//             showSliderDialog(
//               context: context,
//               title: "Adjust volume",
//               divisions: 10,
//               min: 0.0,
//               max: 1.0,
//               stream: player.volumeStream,
//               onChanged: player.setVolume,
//             );
//           },
//         ),
//         FutureBuilder(
//           future: player.sequenceStateStream,
//           builder: (context, snapshot) => IconButton(
//             icon: const Icon(Icons.skip_previous),
//             onPressed: player.hasPrevious ? player.seekToPrevious : null,
//           ),
//         ),
//         StreamBuilder<PlayerState>(
//           stream: player.playerStateStream,
//           builder: (context, snapshot) {
//             final playerState = snapshot.data;
//             final processingState = playerState?.processingState;
//             final playing = playerState?.playing;
//             if (processingState == ProcessingState.loading ||
//                 processingState == ProcessingState.buffering) {
//               return Container(
//                 margin: const EdgeInsets.all(8.0),
//                 width: 64.0,
//                 height: 64.0,
//                 child: const CircularProgressIndicator(),
//               );
//             } else if (playing != true) {
//               return IconButton(
//                 icon: const Icon(Icons.play_arrow),
//                 iconSize: 64.0,
//                 onPressed: player.play,
//               );
//             } else if (processingState != ProcessingState.completed) {
//               return IconButton(
//                 icon: const Icon(Icons.pause),
//                 iconSize: 64.0,
//                 onPressed: player.pause,
//               );
//             } else {
//               return IconButton(
//                 icon: const Icon(Icons.replay),
//                 iconSize: 64.0,
//                 onPressed: () => player.seek(Duration.zero,
//                     index: player.effectiveIndices!.first),
//               );
//             }
//           },
//         ),
//         StreamBuilder<SequenceState?>(
//           stream: player.sequenceStateStream,
//           builder: (context, snapshot) => IconButton(
//             icon: const Icon(Icons.skip_next),
//             onPressed: player.hasNext ? player.seekToNext : null,
//           ),
//         ),
//         StreamBuilder<double>(
//           stream: player.speedStream,
//           builder: (context, snapshot) => IconButton(
//             icon: Text("${snapshot.data?.toStringAsFixed(1)}x",
//                 style: const TextStyle(fontWeight: FontWeight.bold)),
//             onPressed: () {
//               showSliderDialog(
//                 context: context,
//                 title: "Adjust speed",
//                 divisions: 10,
//                 min: 0.5,
//                 max: 1.5,
//                 stream: player.speedStream,
//                 onChanged: player.setSpeed,
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }
