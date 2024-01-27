import 'package:test/test.dart';
import 'package:music_server_api/music_server_api.dart';

/// tests for DefaultApi
void main() {
  final instance = MusicServerApi().getDefaultApi();

  group(DefaultApi, () {
    // Add
    //
    //Future<JsonObject> addQueueSongIdPost(int songId) async
    test('test addQueueSongIdPost', () async {
      // TODO
    });

    // Add
    //
    //Future<Song> addSongsAddPost(Song song) async
    test('test addSongsAddPost', () async {
      // TODO
    });

    // Create
    //
    //Future<JsonObject> createImagesPost(MultipartFile file) async
    test('test createImagesPost', () async {
      // TODO
    });

    // Image
    //
    //Future<JsonObject> imageImagesFileFileNameGet(String fileName) async
    test('test imageImagesFileFileNameGet', () async {
      // TODO
    });

    // Image
    //
    //Future<JsonObject> imageImagesSongsSongIdGet(int songId) async
    test('test imageImagesSongsSongIdGet', () async {
      // TODO
    });

    // Move
    //
    //Future<JsonObject> moveQueueIndexNewIndexPut(int index, int newIndex) async
    test('test moveQueueIndexNewIndexPut', () async {
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

    // Queue
    //
    //Future<BuiltList<Song>> queueQueueGet() async
    test('test queueQueueGet', () async {
      // TODO
    });

    // Remove
    //
    //Future<JsonObject> removeQueueIndexDelete(int index) async
    test('test removeQueueIndexDelete', () async {
      // TODO
    });

    // Remove
    //
    //Future<JsonObject> removeSongsSongIdDelete(int songId) async
    test('test removeSongsSongIdDelete', () async {
      // TODO
    });

    // Rename
    //
    //Future<JsonObject> renameSongsSongIdPut(int songId, Song song) async
    test('test renameSongsSongIdPut', () async {
      // TODO
    });

    // Song
    //
    //Future<Song> songSongsSongIdGet(int songId) async
    test('test songSongsSongIdGet', () async {
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
