// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'console_player.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ConsolePlayer extends ConsolePlayer {
  @override
  final PlayerState state;
  @override
  final num songPosition;
  @override
  final ConsolePlayerCurrentSong? currentSong;

  factory _$ConsolePlayer([void Function(ConsolePlayerBuilder)? updates]) =>
      (new ConsolePlayerBuilder()..update(updates))._build();

  _$ConsolePlayer._(
      {required this.state, required this.songPosition, this.currentSong})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(state, r'ConsolePlayer', 'state');
    BuiltValueNullFieldError.checkNotNull(
        songPosition, r'ConsolePlayer', 'songPosition');
  }

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
        songPosition == other.songPosition &&
        currentSong == other.currentSong;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, state.hashCode);
    _$hash = $jc(_$hash, songPosition.hashCode);
    _$hash = $jc(_$hash, currentSong.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ConsolePlayer')
          ..add('state', state)
          ..add('songPosition', songPosition)
          ..add('currentSong', currentSong))
        .toString();
  }
}

class ConsolePlayerBuilder
    implements Builder<ConsolePlayer, ConsolePlayerBuilder> {
  _$ConsolePlayer? _$v;

  PlayerState? _state;
  PlayerState? get state => _$this._state;
  set state(PlayerState? state) => _$this._state = state;

  num? _songPosition;
  num? get songPosition => _$this._songPosition;
  set songPosition(num? songPosition) => _$this._songPosition = songPosition;

  ConsolePlayerCurrentSongBuilder? _currentSong;
  ConsolePlayerCurrentSongBuilder get currentSong =>
      _$this._currentSong ??= new ConsolePlayerCurrentSongBuilder();
  set currentSong(ConsolePlayerCurrentSongBuilder? currentSong) =>
      _$this._currentSong = currentSong;

  ConsolePlayerBuilder() {
    ConsolePlayer._defaults(this);
  }

  ConsolePlayerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _state = $v.state;
      _songPosition = $v.songPosition;
      _currentSong = $v.currentSong?.toBuilder();
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
              state: BuiltValueNullFieldError.checkNotNull(
                  state, r'ConsolePlayer', 'state'),
              songPosition: BuiltValueNullFieldError.checkNotNull(
                  songPosition, r'ConsolePlayer', 'songPosition'),
              currentSong: _currentSong?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'currentSong';
        _currentSong?.build();
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
