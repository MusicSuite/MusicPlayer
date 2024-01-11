//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:music_server_api/src/model/song.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'music_queue.g.dart';

/// MusicQueue
///
/// Properties:
/// * [queue]
@BuiltValue(instantiable: false)
abstract class MusicQueue {
  @BuiltValueField(wireName: r'queue')
  BuiltList<Song>? get queue;

  @BuiltValueSerializer(custom: true)
  static Serializer<MusicQueue> get serializer => _$MusicQueueSerializer();
}

class _$MusicQueueSerializer implements PrimitiveSerializer<MusicQueue> {
  @override
  final Iterable<Type> types = const [MusicQueue];

  @override
  final String wireName = r'MusicQueue';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MusicQueue object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.queue != null) {
      yield r'queue';
      yield serializers.serialize(
        object.queue,
        specifiedType: const FullType(BuiltList, [FullType(Song)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    MusicQueue object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object,
            specifiedType: specifiedType)
        .toList();
  }

  @override
  MusicQueue deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.deserialize(serialized,
        specifiedType: FullType($MusicQueue)) as $MusicQueue;
  }
}

/// a concrete implementation of [MusicQueue], since [MusicQueue] is not instantiable
@BuiltValue(instantiable: true)
abstract class $MusicQueue
    implements MusicQueue, Built<$MusicQueue, $MusicQueueBuilder> {
  $MusicQueue._();

  factory $MusicQueue([void Function($MusicQueueBuilder)? updates]) =
      _$$MusicQueue;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults($MusicQueueBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<$MusicQueue> get serializer => _$$MusicQueueSerializer();
}

class _$$MusicQueueSerializer implements PrimitiveSerializer<$MusicQueue> {
  @override
  final Iterable<Type> types = const [$MusicQueue, _$$MusicQueue];

  @override
  final String wireName = r'$MusicQueue';

  @override
  Object serialize(
    Serializers serializers,
    $MusicQueue object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.serialize(object, specifiedType: FullType(MusicQueue))!;
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required MusicQueueBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'queue':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(Song)]),
          ) as BuiltList<Song>;
          result.queue.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  $MusicQueue deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = $MusicQueueBuilder();
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
