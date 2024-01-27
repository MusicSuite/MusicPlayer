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
[**createImagesPost**](DefaultApi.md#createimagespost) | **POST** /images | Create
[**imageImagesFileFileNameGet**](DefaultApi.md#imageimagesfilefilenameget) | **GET** /images/file/{file_name} | Image
[**imageImagesSongSongIdGet**](DefaultApi.md#imageimagessongsongidget) | **GET** /images/song/{song_id} | Image
[**moveQueueIndexNewIndexPut**](DefaultApi.md#movequeueindexnewindexput) | **PUT** /queue/{index}/{new_index} | Move
[**nextTrackPlayerActionsNextTrackGet**](DefaultApi.md#nexttrackplayeractionsnexttrackget) | **GET** /player/actions/next_track | Next Track
[**pausePlayerActionsPauseGet**](DefaultApi.md#pauseplayeractionspauseget) | **GET** /player/actions/pause | Pause
[**playPlayerActionsPlayGet**](DefaultApi.md#playplayeractionsplayget) | **GET** /player/actions/play | Play
[**playerPlayerGet**](DefaultApi.md#playerplayerget) | **GET** /player | Player
[**queueQueueGet**](DefaultApi.md#queuequeueget) | **GET** /queue | Queue
[**removeQueueIndexDelete**](DefaultApi.md#removequeueindexdelete) | **DELETE** /queue/{index} | Remove
[**removeSongsSongIdDelete**](DefaultApi.md#removesongssongiddelete) | **DELETE** /songs/{song_id} | Remove
[**renameSongsSongIdPut**](DefaultApi.md#renamesongssongidput) | **PUT** /songs/{song_id} | Rename
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

# **createImagesPost**
> JsonObject createImagesPost(file)

Create

### Example
```dart
import 'package:music_server_api/api.dart';

final api = MusicServerApi().getDefaultApi();
final MultipartFile file = BINARY_DATA_HERE; // MultipartFile | 

try {
    final response = api.createImagesPost(file);
    print(response);
} catch on DioError (e) {
    print('Exception when calling DefaultApi->createImagesPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **file** | **MultipartFile**|  | 

### Return type

[**JsonObject**](JsonObject.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **imageImagesFileFileNameGet**
> JsonObject imageImagesFileFileNameGet(fileName)

Image

### Example
```dart
import 'package:music_server_api/api.dart';

final api = MusicServerApi().getDefaultApi();
final String fileName = fileName_example; // String | 

try {
    final response = api.imageImagesFileFileNameGet(fileName);
    print(response);
} catch on DioError (e) {
    print('Exception when calling DefaultApi->imageImagesFileFileNameGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **fileName** | **String**|  | 

### Return type

[**JsonObject**](JsonObject.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **imageImagesSongSongIdGet**
> JsonObject imageImagesSongSongIdGet(songId)

Image

### Example
```dart
import 'package:music_server_api/api.dart';

final api = MusicServerApi().getDefaultApi();
final int songId = 56; // int | 

try {
    final response = api.imageImagesSongSongIdGet(songId);
    print(response);
} catch on DioError (e) {
    print('Exception when calling DefaultApi->imageImagesSongSongIdGet: $e\n');
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

# **moveQueueIndexNewIndexPut**
> JsonObject moveQueueIndexNewIndexPut(index, newIndex)

Move

### Example
```dart
import 'package:music_server_api/api.dart';

final api = MusicServerApi().getDefaultApi();
final int index = 56; // int | 
final int newIndex = 56; // int | 

try {
    final response = api.moveQueueIndexNewIndexPut(index, newIndex);
    print(response);
} catch on DioError (e) {
    print('Exception when calling DefaultApi->moveQueueIndexNewIndexPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **index** | **int**|  | 
 **newIndex** | **int**|  | 

### Return type

[**JsonObject**](JsonObject.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
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

# **removeQueueIndexDelete**
> JsonObject removeQueueIndexDelete(index)

Remove

### Example
```dart
import 'package:music_server_api/api.dart';

final api = MusicServerApi().getDefaultApi();
final int index = 56; // int | 

try {
    final response = api.removeQueueIndexDelete(index);
    print(response);
} catch on DioError (e) {
    print('Exception when calling DefaultApi->removeQueueIndexDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **index** | **int**|  | 

### Return type

[**JsonObject**](JsonObject.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **removeSongsSongIdDelete**
> JsonObject removeSongsSongIdDelete(songId)

Remove

### Example
```dart
import 'package:music_server_api/api.dart';

final api = MusicServerApi().getDefaultApi();
final int songId = 56; // int | 

try {
    final response = api.removeSongsSongIdDelete(songId);
    print(response);
} catch on DioError (e) {
    print('Exception when calling DefaultApi->removeSongsSongIdDelete: $e\n');
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

# **renameSongsSongIdPut**
> JsonObject renameSongsSongIdPut(songId, song)

Rename

### Example
```dart
import 'package:music_server_api/api.dart';

final api = MusicServerApi().getDefaultApi();
final int songId = 56; // int | 
final Song song = ; // Song | 

try {
    final response = api.renameSongsSongIdPut(songId, song);
    print(response);
} catch on DioError (e) {
    print('Exception when calling DefaultApi->renameSongsSongIdPut: $e\n');
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

