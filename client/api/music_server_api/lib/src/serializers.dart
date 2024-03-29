//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_import

import 'package:one_of_serializer/any_of_serializer.dart';
import 'package:one_of_serializer/one_of_serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:music_server_api/src/date_serializer.dart';
import 'package:music_server_api/src/model/date.dart';

import 'package:music_server_api/src/model/console_player.dart';
import 'package:music_server_api/src/model/http_validation_error.dart';
import 'package:music_server_api/src/model/location_inner.dart';
import 'package:music_server_api/src/model/player_state.dart';
import 'package:music_server_api/src/model/song.dart';
import 'package:music_server_api/src/model/validation_error.dart';

part 'serializers.g.dart';

@SerializersFor([
  ConsolePlayer,
  HTTPValidationError,
  LocationInner,
  PlayerState,
  Song,
  ValidationError,
])
Serializers serializers = (_$serializers.toBuilder()
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(Song)]),
        () => ListBuilder<Song>(),
      )
      ..add(const OneOfSerializer())
      ..add(const AnyOfSerializer())
      ..add(const DateSerializer())
      ..add(Iso8601DateTimeSerializer()))
    .build();

Serializers standardSerializers =
    (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
