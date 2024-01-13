//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'song.g.dart';

/// Song
///
/// Properties:
/// * [id]
/// * [title]
/// * [duration]
@BuiltValue(instantiable: false)
abstract class Song {
  @BuiltValueField(wireName: r'id')
  int get id;

  @BuiltValueField(wireName: r'title')
  String get title;

  @BuiltValueField(wireName: r'duration')
  num get duration;

  @BuiltValueSerializer(custom: true)
  static Serializer<Song> get serializer => _$SongSerializer();
}

class _$SongSerializer implements PrimitiveSerializer<Song> {
  @override
  final Iterable<Type> types = const [Song];

  @override
  final String wireName = r'Song';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Song object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
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
    yield r'duration';
    yield serializers.serialize(
      object.duration,
      specifiedType: const FullType(num),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    Song object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object,
            specifiedType: specifiedType)
        .toList();
  }

  @override
  Song deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.deserialize(serialized, specifiedType: FullType($Song))
        as $Song;
  }
}

/// a concrete implementation of [Song], since [Song] is not instantiable
@BuiltValue(instantiable: true)
abstract class $Song implements Song, Built<$Song, $SongBuilder> {
  $Song._();

  factory $Song([void Function($SongBuilder)? updates]) = _$$Song;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults($SongBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<$Song> get serializer => _$$SongSerializer();
}

class _$$SongSerializer implements PrimitiveSerializer<$Song> {
  @override
  final Iterable<Type> types = const [$Song, _$$Song];

  @override
  final String wireName = r'$Song';

  @override
  Object serialize(
    Serializers serializers,
    $Song object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.serialize(object, specifiedType: FullType(Song))!;
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SongBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
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
        case r'duration':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.duration = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  $Song deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = $SongBuilder();
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
