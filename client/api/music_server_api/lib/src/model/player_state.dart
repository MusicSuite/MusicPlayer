//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'player_state.g.dart';

class PlayerState extends EnumClass {
  @BuiltValueEnumConst(wireName: r'PLAYING')
  static const PlayerState PLAYING = _$PLAYING;
  @BuiltValueEnumConst(wireName: r'PAUSED')
  static const PlayerState PAUSED = _$PAUSED;
  @BuiltValueEnumConst(wireName: r'STOPPED', fallback: true)
  static const PlayerState STOPPED = _$STOPPED;

  static Serializer<PlayerState> get serializer => _$playerStateSerializer;

  const PlayerState._(String name) : super(name);

  static BuiltSet<PlayerState> get values => _$values;
  static PlayerState valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class PlayerStateMixin = Object with _$PlayerStateMixin;
