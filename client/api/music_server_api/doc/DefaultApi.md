# music_server_api.api.DefaultApi

## Load the API package
```dart
import 'package:music_server_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**addQueueAddPost**](DefaultApi.md#addqueueaddpost) | **POST** /queue/add | Add
[**addSongsAddPost**](DefaultApi.md#addsongsaddpost) | **POST** /songs/add | Add
[**nextTrackPlayerActionsNextTrackGet**](DefaultApi.md#nexttrackplayeractionsnexttrackget) | **GET** /player/actions/next_track | Next Track
[**pausePlayerActionsPauseGet**](DefaultApi.md#pauseplayeractionspauseget) | **GET** /player/actions/pause | Pause
[**peekQueuePeekGet**](DefaultApi.md#peekqueuepeekget) | **GET** /queue/peek | Peek
[**playPlayerActionsPlayGet**](DefaultApi.md#playplayeractionsplayget) | **GET** /player/actions/play | Play
[**playerPlayerGet**](DefaultApi.md#playerplayerget) | **GET** /player | Player
[**playingPlayerPlayingGet**](DefaultApi.md#playingplayerplayingget) | **GET** /player/playing | Playing
[**queueQueueGet**](DefaultApi.md#queuequeueget) | **GET** /queue | Queue
[**removeSongsRemoveSongIdDelete**](DefaultApi.md#removesongsremovesongiddelete) | **DELETE** /songs/remove/{song_id} | Remove
[**renameSongsReplacePut**](DefaultApi.md#renamesongsreplaceput) | **PUT** /songs/replace | Rename
[**shuffleQueueShuffleGet**](DefaultApi.md#shufflequeueshuffleget) | **GET** /queue/shuffle | Shuffle
[**songsSongsGet**](DefaultApi.md#songssongsget) | **GET** /songs | Songs
[**stopPlayerActionsStopGet**](DefaultApi.md#stopplayeractionsstopget) | **GET** /player/actions/stop | Stop


# **addQueueAddPost**
> JsonObject addQueueAddPost(song)

Add

### Example
```dart
import 'package:music_server_api/api.dart';

final api = MusicServerApi().getDefaultApi();
final Song song = ; // Song | 

try {
    final response = api.addQueueAddPost(song);
    print(response);
} catch on DioError (e) {
    print('Exception when calling DefaultApi->addQueueAddPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **song** | [**Song**](Song.md)|  | 

### Return type

[**JsonObject**](JsonObject.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **addSongsAddPost**
> JsonObject addSongsAddPost(song)

Add

### Example
```dart
import 'package:music_server_api/api.dart';

final api = MusicServerApi().getDefaultApi();
final Song song = ; // Song | 

try {
    final response = api.addSongsAddPost(song);
    print(response);
} catch on DioError (e) {
    print('Exception when calling DefaultApi->addSongsAddPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **song** | [**Song**](Song.md)|  | 

### Return type

[**JsonObject**](JsonObject.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **nextTrackPlayerActionsNextTrackGet**
> JsonObject nextTrackPlayerActionsNextTrackGet()

Next Track

### Example
```dart
import 'package:music_server_api/api.dart';

final api = MusicServerApi().getDefaultApi();

try {
    final response = api.nextTrackPlayerActionsNextTrackGet();
    print(response);
} catch on DioError (e) {
    print('Exception when calling DefaultApi->nextTrackPlayerActionsNextTrackGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**JsonObject**](JsonObject.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **pausePlayerActionsPauseGet**
> JsonObject pausePlayerActionsPauseGet()

Pause

### Example
```dart
import 'package:music_server_api/api.dart';

final api = MusicServerApi().getDefaultApi();

try {
    final response = api.pausePlayerActionsPauseGet();
    print(response);
} catch on DioError (e) {
    print('Exception when calling DefaultApi->pausePlayerActionsPauseGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**JsonObject**](JsonObject.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **peekQueuePeekGet**
> Song peekQueuePeekGet()

Peek

### Example
```dart
import 'package:music_server_api/api.dart';

final api = MusicServerApi().getDefaultApi();

try {
    final response = api.peekQueuePeekGet();
    print(response);
} catch on DioError (e) {
    print('Exception when calling DefaultApi->peekQueuePeekGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**Song**](Song.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **playPlayerActionsPlayGet**
> JsonObject playPlayerActionsPlayGet()

Play

### Example
```dart
import 'package:music_server_api/api.dart';

final api = MusicServerApi().getDefaultApi();

try {
    final response = api.playPlayerActionsPlayGet();
    print(response);
} catch on DioError (e) {
    print('Exception when calling DefaultApi->playPlayerActionsPlayGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**JsonObject**](JsonObject.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **playerPlayerGet**
> ConsolePlayer playerPlayerGet()

Player

### Example
```dart
import 'package:music_server_api/api.dart';

final api = MusicServerApi().getDefaultApi();

try {
    final response = api.playerPlayerGet();
    print(response);
} catch on DioError (e) {
    print('Exception when calling DefaultApi->playerPlayerGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**ConsolePlayer**](ConsolePlayer.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **playingPlayerPlayingGet**
> Song playingPlayerPlayingGet()

Playing

### Example
```dart
import 'package:music_server_api/api.dart';

final api = MusicServerApi().getDefaultApi();

try {
    final response = api.playingPlayerPlayingGet();
    print(response);
} catch on DioError (e) {
    print('Exception when calling DefaultApi->playingPlayerPlayingGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**Song**](Song.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **queueQueueGet**
> BuiltList<Song> queueQueueGet()

Queue

### Example
```dart
import 'package:music_server_api/api.dart';

final api = MusicServerApi().getDefaultApi();

try {
    final response = api.queueQueueGet();
    print(response);
} catch on DioError (e) {
    print('Exception when calling DefaultApi->queueQueueGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;Song&gt;**](Song.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **removeSongsRemoveSongIdDelete**
> JsonObject removeSongsRemoveSongIdDelete(songId)

Remove

### Example
```dart
import 'package:music_server_api/api.dart';

final api = MusicServerApi().getDefaultApi();
final int songId = 56; // int | 

try {
    final response = api.removeSongsRemoveSongIdDelete(songId);
    print(response);
} catch on DioError (e) {
    print('Exception when calling DefaultApi->removeSongsRemoveSongIdDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **songId** | **int**|  | 

### Return type

[**JsonObject**](JsonObject.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **renameSongsReplacePut**
> JsonObject renameSongsReplacePut(bodyRenameSongsReplacePut)

Rename

### Example
```dart
import 'package:music_server_api/api.dart';

final api = MusicServerApi().getDefaultApi();
final BodyRenameSongsReplacePut bodyRenameSongsReplacePut = ; // BodyRenameSongsReplacePut | 

try {
    final response = api.renameSongsReplacePut(bodyRenameSongsReplacePut);
    print(response);
} catch on DioError (e) {
    print('Exception when calling DefaultApi->renameSongsReplacePut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **bodyRenameSongsReplacePut** | [**BodyRenameSongsReplacePut**](BodyRenameSongsReplacePut.md)|  | 

### Return type

[**JsonObject**](JsonObject.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **shuffleQueueShuffleGet**
> JsonObject shuffleQueueShuffleGet()

Shuffle

### Example
```dart
import 'package:music_server_api/api.dart';

final api = MusicServerApi().getDefaultApi();

try {
    final response = api.shuffleQueueShuffleGet();
    print(response);
} catch on DioError (e) {
    print('Exception when calling DefaultApi->shuffleQueueShuffleGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**JsonObject**](JsonObject.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **songsSongsGet**
> BuiltList<Song> songsSongsGet()

Songs

### Example
```dart
import 'package:music_server_api/api.dart';

final api = MusicServerApi().getDefaultApi();

try {
    final response = api.songsSongsGet();
    print(response);
} catch on DioError (e) {
    print('Exception when calling DefaultApi->songsSongsGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;Song&gt;**](Song.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **stopPlayerActionsStopGet**
> JsonObject stopPlayerActionsStopGet()

Stop

### Example
```dart
import 'package:music_server_api/api.dart';

final api = MusicServerApi().getDefaultApi();

try {
    final response = api.stopPlayerActionsStopGet();
    print(response);
} catch on DioError (e) {
    print('Exception when calling DefaultApi->stopPlayerActionsStopGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**JsonObject**](JsonObject.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)
