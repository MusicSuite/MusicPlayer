//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:music_server_api/src/model/music_queue.dart';
import 'package:music_server_api/src/model/song.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'console_player_queue.g.dart';

/// ConsolePlayerQueue
///
/// Properties:
/// * [queue]
@BuiltValue()
abstract class ConsolePlayerQueue
    implements
        MusicQueue,
        Built<ConsolePlayerQueue, ConsolePlayerQueueBuilder> {
  ConsolePlayerQueue._();

  factory ConsolePlayerQueue([void updates(ConsolePlayerQueueBuilder b)]) =
      _$ConsolePlayerQueue;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ConsolePlayerQueueBuilder b) =>
      b..queue = ListBuilder();

  @BuiltValueSerializer(custom: true)
  static Serializer<ConsolePlayerQueue> get serializer =>
      _$ConsolePlayerQueueSerializer();
}

class _$ConsolePlayerQueueSerializer
    implements PrimitiveSerializer<ConsolePlayerQueue> {
  @override
  final Iterable<Type> types = const [ConsolePlayerQueue, _$ConsolePlayerQueue];

  @override
  final String wireName = r'ConsolePlayerQueue';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ConsolePlayerQueue object, {
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
    ConsolePlayerQueue object, {
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
    required ConsolePlayerQueueBuilder result,
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
  ConsolePlayerQueue deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ConsolePlayerQueueBuilder();
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
