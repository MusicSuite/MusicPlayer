//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:music_server_api/src/model/player_state.dart';
import 'package:music_server_api/src/model/song.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'console_player.g.dart';

/// ConsolePlayer
///
/// Properties:
/// * [state]
/// * [songPosition]
/// * [currentSong]
@BuiltValue()
abstract class ConsolePlayer
    implements Built<ConsolePlayer, ConsolePlayerBuilder> {
  @BuiltValueField(wireName: r'state')
  PlayerState get state;
  // enum stateEnum {  PLAYING,  PAUSED,  STOPPED,  };

  @BuiltValueField(wireName: r'song_position')
  num get songPosition;

  @BuiltValueField(wireName: r'current_song')
  Song? get currentSong;

  ConsolePlayer._();

  factory ConsolePlayer([void updates(ConsolePlayerBuilder b)]) =
      _$ConsolePlayer;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ConsolePlayerBuilder b) => b;

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
    yield r'state';
    yield serializers.serialize(
      object.state,
      specifiedType: const FullType(PlayerState),
    );
    yield r'song_position';
    yield serializers.serialize(
      object.songPosition,
      specifiedType: const FullType(num),
    );
    if (object.currentSong != null) {
      yield r'current_song';
      yield serializers.serialize(
        object.currentSong,
        specifiedType: const FullType(Song),
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
            specifiedType: const FullType(PlayerState),
          ) as PlayerState;
          result.state = valueDes;
          break;
        case r'song_position':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.songPosition = valueDes;
          break;
        case r'current_song':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Song),
          ) as Song;
          result.currentSong.replace(valueDes);
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
