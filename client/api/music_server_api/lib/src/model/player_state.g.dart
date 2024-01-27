// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const PlayerState _$PLAYING = const PlayerState._('PLAYING');
const PlayerState _$PAUSED = const PlayerState._('PAUSED');
const PlayerState _$STOPPED = const PlayerState._('STOPPED');

PlayerState _$valueOf(String name) {
  switch (name) {
    case 'PLAYING':
      return _$PLAYING;
    case 'PAUSED':
      return _$PAUSED;
    case 'STOPPED':
      return _$STOPPED;
    default:
      return _$STOPPED;
  }
}

final BuiltSet<PlayerState> _$values =
    new BuiltSet<PlayerState>(const <PlayerState>[
  _$PLAYING,
  _$PAUSED,
  _$STOPPED,
]);

class _$PlayerStateMeta {
  const _$PlayerStateMeta();
  PlayerState get PLAYING => _$PLAYING;
  PlayerState get PAUSED => _$PAUSED;
  PlayerState get STOPPED => _$STOPPED;
  PlayerState valueOf(String name) => _$valueOf(name);
  BuiltSet<PlayerState> get values => _$values;
}

abstract class _$PlayerStateMixin {
  // ignore: non_constant_identifier_names
  _$PlayerStateMeta get PlayerState => const _$PlayerStateMeta();
}

Serializer<PlayerState> _$playerStateSerializer = new _$PlayerStateSerializer();

class _$PlayerStateSerializer implements PrimitiveSerializer<PlayerState> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'PLAYING': 'PLAYING',
    'PAUSED': 'PAUSED',
    'STOPPED': 'STOPPED',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'PLAYING': 'PLAYING',
    'PAUSED': 'PAUSED',
    'STOPPED': 'STOPPED',
  };

  @override
  final Iterable<Type> types = const <Type>[PlayerState];
  @override
  final String wireName = 'PlayerState';

  @override
  Object serialize(Serializers serializers, PlayerState object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  PlayerState deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      PlayerState.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
