// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const State _$PLAYING = const State._('PLAYING');
const State _$PAUSED = const State._('PAUSED');
const State _$STOPPED = const State._('STOPPED');

State _$valueOf(String name) {
  switch (name) {
    case 'PLAYING':
      return _$PLAYING;
    case 'PAUSED':
      return _$PAUSED;
    case 'STOPPED':
      return _$STOPPED;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<State> _$values = new BuiltSet<State>(const <State>[
  _$PLAYING,
  _$PAUSED,
  _$STOPPED,
]);

class _$StateMeta {
  const _$StateMeta();
  State get PLAYING => _$PLAYING;
  State get PAUSED => _$PAUSED;
  State get STOPPED => _$STOPPED;
  State valueOf(String name) => _$valueOf(name);
  BuiltSet<State> get values => _$values;
}

abstract class _$StateMixin {
  // ignore: non_constant_identifier_names
  _$StateMeta get State => const _$StateMeta();
}

Serializer<State> _$stateSerializer = new _$StateSerializer();

class _$StateSerializer implements PrimitiveSerializer<State> {
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
  final Iterable<Type> types = const <Type>[State];
  @override
  final String wireName = 'State';

  @override
  Object serialize(Serializers serializers, State object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  State deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      State.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
