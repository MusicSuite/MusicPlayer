//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:music_server_api/src/model/song.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'body_rename_songs_replace_put.g.dart';

/// BodyRenameSongsReplacePut
///
/// Properties:
/// * [oldSong]
/// * [newSong]
@BuiltValue()
abstract class BodyRenameSongsReplacePut
    implements
        Built<BodyRenameSongsReplacePut, BodyRenameSongsReplacePutBuilder> {
  @BuiltValueField(wireName: r'old_song')
  Song get oldSong;

  @BuiltValueField(wireName: r'new_song')
  Song get newSong;

  BodyRenameSongsReplacePut._();

  factory BodyRenameSongsReplacePut(
          [void updates(BodyRenameSongsReplacePutBuilder b)]) =
      _$BodyRenameSongsReplacePut;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BodyRenameSongsReplacePutBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<BodyRenameSongsReplacePut> get serializer =>
      _$BodyRenameSongsReplacePutSerializer();
}

class _$BodyRenameSongsReplacePutSerializer
    implements PrimitiveSerializer<BodyRenameSongsReplacePut> {
  @override
  final Iterable<Type> types = const [
    BodyRenameSongsReplacePut,
    _$BodyRenameSongsReplacePut
  ];

  @override
  final String wireName = r'BodyRenameSongsReplacePut';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    BodyRenameSongsReplacePut object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'old_song';
    yield serializers.serialize(
      object.oldSong,
      specifiedType: const FullType(Song),
    );
    yield r'new_song';
    yield serializers.serialize(
      object.newSong,
      specifiedType: const FullType(Song),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    BodyRenameSongsReplacePut object, {
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
    required BodyRenameSongsReplacePutBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'old_song':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Song),
          ) as Song;
          result.oldSong.replace(valueDes);
          break;
        case r'new_song':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Song),
          ) as Song;
          result.newSong.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  BodyRenameSongsReplacePut deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BodyRenameSongsReplacePutBuilder();
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
