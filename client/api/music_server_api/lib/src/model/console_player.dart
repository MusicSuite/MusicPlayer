//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:music_server_api/src/model/console_player_queue.dart';
import 'package:music_server_api/src/model/state.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'console_player.g.dart';

/// ConsolePlayer
///
/// Properties:
/// * [state]
/// * [queue]
/// * [volume]
/// * [songPosition]
@BuiltValue()
abstract class ConsolePlayer
    implements Built<ConsolePlayer, ConsolePlayerBuilder> {
  @BuiltValueField(wireName: r'state')
  State? get state;
  // enum stateEnum {  PLAYING,  PAUSED,  STOPPED,  };

  @BuiltValueField(wireName: r'queue')
  ConsolePlayerQueue? get queue;

  @BuiltValueField(wireName: r'volume')
  int? get volume;

  @BuiltValueField(wireName: r'song_position')
  int? get songPosition;

  ConsolePlayer._();

  factory ConsolePlayer([void updates(ConsolePlayerBuilder b)]) =
      _$ConsolePlayer;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ConsolePlayerBuilder b) => b
    ..volume = 60
    ..songPosition = 0;

  @BuiltValueSerializer(custom: true)
  static Serializer<ConsolePlayer> get serializer =>
      _$ConsolePlayerSerializer();
}

class _$ConsolePlayerSerializer implements PrimitiveSerializer<ConsolePlayer> {
  @override
  final Iterable<Type> types = const [ConsolePlayer, _$ConsolePlayer];

  @override
  final String wireName = r'ConsolePlayer';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ConsolePlayer object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.state != null) {
      yield r'state';
      yield serializers.serialize(
        object.state,
        specifiedType: const FullType(State),
      );
    }
    if (object.queue != null) {
      yield r'queue';
      yield serializers.serialize(
        object.queue,
        specifiedType: const FullType(ConsolePlayerQueue),
      );
    }
    if (object.volume != null) {
      yield r'volume';
      yield serializers.serialize(
        object.volume,
        specifiedType: const FullType(int),
      );
    }
    if (object.songPosition != null) {
      yield r'song_position';
      yield serializers.serialize(
        object.songPosition,
        specifiedType: const FullType(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ConsolePlayer object, {
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
    required ConsolePlayerBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'state':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(State),
          ) as State;
          result.state = valueDes;
          break;
        case r'queue':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ConsolePlayerQueue),
          ) as ConsolePlayerQueue;
          result.queue.replace(valueDes);
          break;
        case r'volume':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.volume = valueDes;
          break;
        case r'song_position':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.songPosition = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ConsolePlayer deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ConsolePlayerBuilder();
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