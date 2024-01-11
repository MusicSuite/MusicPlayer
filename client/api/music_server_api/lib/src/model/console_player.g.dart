// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'console_player.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ConsolePlayer extends ConsolePlayer {
  @override
  final State? state;
  @override
  final ConsolePlayerQueue? queue;
  @override
  final int? volume;
  @override
  final int? songPosition;

  factory _$ConsolePlayer([void Function(ConsolePlayerBuilder)? updates]) =>
      (new ConsolePlayerBuilder()..update(updates))._build();

  _$ConsolePlayer._({this.state, this.queue, this.volume, this.songPosition})
      : super._();

  @override
  ConsolePlayer rebuild(void Function(ConsolePlayerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConsolePlayerBuilder toBuilder() => new ConsolePlayerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConsolePlayer &&
        state == other.state &&
        queue == other.queue &&
        volume == other.volume &&
        songPosition == other.songPosition;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, state.hashCode);
    _$hash = $jc(_$hash, queue.hashCode);
    _$hash = $jc(_$hash, volume.hashCode);
    _$hash = $jc(_$hash, songPosition.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ConsolePlayer')
          ..add('state', state)
          ..add('queue', queue)
          ..add('volume', volume)
          ..add('songPosition', songPosition))
        .toString();
  }
}

class ConsolePlayerBuilder
    implements Builder<ConsolePlayer, ConsolePlayerBuilder> {
  _$ConsolePlayer? _$v;

  State? _state;
  State? get state => _$this._state;
  set state(State? state) => _$this._state = state;

  ConsolePlayerQueueBuilder? _queue;
  ConsolePlayerQueueBuilder get queue =>
      _$this._queue ??= new ConsolePlayerQueueBuilder();
  set queue(ConsolePlayerQueueBuilder? queue) => _$this._queue = queue;

  int? _volume;
  int? get volume => _$this._volume;
  set volume(int? volume) => _$this._volume = volume;

  int? _songPosition;
  int? get songPosition => _$this._songPosition;
  set songPosition(int? songPosition) => _$this._songPosition = songPosition;

  ConsolePlayerBuilder() {
    ConsolePlayer._defaults(this);
  }

  ConsolePlayerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _state = $v.state;
      _queue = $v.queue?.toBuilder();
      _volume = $v.volume;
      _songPosition = $v.songPosition;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConsolePlayer other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ConsolePlayer;
  }

  @override
  void update(void Function(ConsolePlayerBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ConsolePlayer build() => _build();

  _$ConsolePlayer _build() {
    _$ConsolePlayer _$result;
    try {
      _$result = _$v ??
          new _$ConsolePlayer._(
              state: state,
              queue: _queue?.build(),
              volume: volume,
              songPosition: songPosition);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'queue';
        _queue?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ConsolePlayer', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
