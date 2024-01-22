# music_server_api.api.DefaultApi

## Load the API package
```dart
import 'package:music_server_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**addQueueSongIdPost**](DefaultApi.md#addqueuesongidpost) | **POST** /queue/{song_id} | Add
[**addSongsAddPost**](DefaultApi.md#addsongsaddpost) | **POST** /songs/add | Add
[**nextTrackPlayerActionsNextTrackGet**](DefaultApi.md#nexttrackplayeractionsnexttrackget) | **GET** /player/actions/next_track | Next Track
[**pausePlayerActionsPauseGet**](DefaultApi.md#pauseplayeractionspauseget) | **GET** /player/actions/pause | Pause
[**playPlayerActionsPlayGet**](DefaultApi.md#playplayeractionsplayget) | **GET** /player/actions/play | Play
[**playerPlayerGet**](DefaultApi.md#playerplayerget) | **GET** /player | Player
[**queueQueueGet**](DefaultApi.md#queuequeueget) | **GET** /queue | Queue
[**removeSongsSongIdRemoveDelete**](DefaultApi.md#removesongssongidremovedelete) | **DELETE** /songs/{song_id}/remove | Remove
[**renameSongsSongIdReplacePut**](DefaultApi.md#renamesongssongidreplaceput) | **PUT** /songs/{song_id}/replace | Rename
[**songSongsSongIdGet**](DefaultApi.md#songsongssongidget) | **GET** /songs/{song_id} | Song
[**songsSongsGet**](DefaultApi.md#songssongsget) | **GET** /songs | Songs
[**stopPlayerActionsStopGet**](DefaultApi.md#stopplayeractionsstopget) | **GET** /player/actions/stop | Stop


# **addQueueSongIdPost**
> JsonObject addQueueSongIdPost(songId)

Add

### Example
```dart
import 'package:music_server_api/api.dart';

final api = MusicServerApi().getDefaultApi();
final int songId = 56; // int | 

try {
    final response = api.addQueueSongIdPost(songId);
    print(response);
} catch on DioError (e) {
    print('Exception when calling DefaultApi->addQueueSongIdPost: $e\n');
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

# **addSongsAddPost**
> Song addSongsAddPost(song)

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

[**Song**](Song.md)

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

# **removeSongsSongIdRemoveDelete**
> JsonObject removeSongsSongIdRemoveDelete(songId)

Remove

### Example
```dart
import 'package:music_server_api/api.dart';

final api = MusicServerApi().getDefaultApi();
final int songId = 56; // int | 

try {
    final response = api.removeSongsSongIdRemoveDelete(songId);
    print(response);
} catch on DioError (e) {
    print('Exception when calling DefaultApi->removeSongsSongIdRemoveDelete: $e\n');
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

# **renameSongsSongIdReplacePut**
> JsonObject renameSongsSongIdReplacePut(songId, song)

Rename

### Example
```dart
import 'package:music_server_api/api.dart';

final api = MusicServerApi().getDefaultApi();
final int songId = 56; // int | 
final Song song = ; // Song | 

try {
    final response = api.renameSongsSongIdReplacePut(songId, song);
    print(response);
} catch on DioError (e) {
    print('Exception when calling DefaultApi->renameSongsSongIdReplacePut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **songId** | **int**|  | 
 **song** | [**Song**](Song.md)|  | 

### Return type

[**JsonObject**](JsonObject.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **songSongsSongIdGet**
> Song songSongsSongIdGet(songId)

Song

### Example
```dart
import 'package:music_server_api/api.dart';

final api = MusicServerApi().getDefaultApi();
final int songId = 56; // int | 

try {
    final response = api.songSongsSongIdGet(songId);
    print(response);
} catch on DioError (e) {
    print('Exception when calling DefaultApi->songSongsSongIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **songId** | **int**|  | 

### Return type

[**Song**](Song.md)

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

