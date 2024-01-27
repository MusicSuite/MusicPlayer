//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:music_server_api/src/model/song.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'console_player_current_song.g.dart';

/// ConsolePlayerCurrentSong
///
/// Properties:
/// * [id]
/// * [title]
/// * [artist]
/// * [duration]
/// * [thumbnailFileName]
@BuiltValue()
abstract class ConsolePlayerCurrentSong
    implements
        Song,
        Built<ConsolePlayerCurrentSong, ConsolePlayerCurrentSongBuilder> {
  ConsolePlayerCurrentSong._();

  factory ConsolePlayerCurrentSong(
          [void updates(ConsolePlayerCurrentSongBuilder b)]) =
      _$ConsolePlayerCurrentSong;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ConsolePlayerCurrentSongBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ConsolePlayerCurrentSong> get serializer =>
      _$ConsolePlayerCurrentSongSerializer();
}

class _$ConsolePlayerCurrentSongSerializer
    implements PrimitiveSerializer<ConsolePlayerCurrentSong> {
  @override
  final Iterable<Type> types = const [
    ConsolePlayerCurrentSong,
    _$ConsolePlayerCurrentSong
  ];

  @override
  final String wireName = r'ConsolePlayerCurrentSong';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ConsolePlayerCurrentSong object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'duration';
    yield serializers.serialize(
      object.duration,
      specifiedType: const FullType(num),
    );
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(int),
    );
    yield r'title';
    yield serializers.serialize(
      object.title,
      specifiedType: const FullType(String),
    );
    yield r'artist';
    yield serializers.serialize(
      object.artist,
      specifiedType: const FullType(String),
    );
    if (object.thumbnailFileName != null) {
      yield r'thumbnail_file_name';
      yield serializers.serialize(
        object.thumbnailFileName,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ConsolePlayerCurrentSong object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object,
            specifiedType: specifiedType)
        .toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ConsolePlayerCurrentSongBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'duration':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.duration = valueDes;
          break;
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.id = valueDes;
          break;
        case r'title':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.title = valueDes;
          break;
        case r'artist':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.artist = valueDes;
          break;
        case r'thumbnail_file_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.thumbnailFileName = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ConsolePlayerCurrentSong deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ConsolePlayerCurrentSongBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}
