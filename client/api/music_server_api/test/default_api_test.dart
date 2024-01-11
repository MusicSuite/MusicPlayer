import 'package:test/test.dart';
import 'package:music_server_api/music_server_api.dart';

/// tests for DefaultApi
void main() {
  final instance = MusicServerApi().getDefaultApi();

  group(DefaultApi, () {
    // Add
    //
    //Future<JsonObject> addQueueAddPost(Song song) async
    test('test addQueueAddPost', () async {
      // TODO
    });

    // Add
    //
    //Future<JsonObject> addSongsAddPost(Song song) async
    test('test addSongsAddPost', () async {
      // TODO
    });

    // Next Track
    //
    //Future<JsonObject> nextTrackPlayerActionsNextTrackGet() async
    test('test nextTrackPlayerActionsNextTrackGet', () async {
      // TODO
    });

    // Pause
    //
    //Future<JsonObject> pausePlayerActionsPauseGet() async
    test('test pausePlayerActionsPauseGet', () async {
      // TODO
    });

    // Peek
    //
    //Future<Song> peekQueuePeekGet() async
    test('test peekQueuePeekGet', () async {
      // TODO
    });

    // Play
    //
    //Future<JsonObject> playPlayerActionsPlayGet() async
    test('test playPlayerActionsPlayGet', () async {
      // TODO
    });

    // Player
    //
    //Future<ConsolePlayer> playerPlayerGet() async
    test('test playerPlayerGet', () async {
      // TODO
    });

    // Playing
    //
    //Future<Song> playingPlayerPlayingGet() async
    test('test playingPlayerPlayingGet', () async {
      // TODO
    });

    // Queue
    //
    //Future<BuiltList<Song>> queueQueueGet() async
    test('test queueQueueGet', () async {
      // TODO
    });

    // Remove
    //
    //Future<JsonObject> removeSongsRemoveSongIdDelete(int songId) async
    test('test removeSongsRemoveSongIdDelete', () async {
      // TODO
    });

    // Rename
    //
    //Future<JsonObject> renameSongsReplacePut(BodyRenameSongsReplacePut bodyRenameSongsReplacePut) async
    test('test renameSongsReplacePut', () async {
      // TODO
    });

    // Shuffle
    //
    //Future<JsonObject> shuffleQueueShuffleGet() async
    test('test shuffleQueueShuffleGet', () async {
      // TODO
    });

    // Songs
    //
    //Future<BuiltList<Song>> songsSongsGet() async
    test('test songsSongsGet', () async {
      // TODO
    });

    // Stop
    //
    //Future<JsonObject> stopPlayerActionsStopGet() async
    test('test stopPlayerActionsStopGet', () async {
      // TODO
    });
  });
}
