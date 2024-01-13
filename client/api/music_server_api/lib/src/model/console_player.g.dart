// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'console_player.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ConsolePlayer extends ConsolePlayer {
  @override
  final PlayerState? state;
  @override
  final int? volume;
  @override
  final ConsolePlayerCurrentSong? currentSong;
  @override
  final int? songPosition;

  factory _$ConsolePlayer([void Function(ConsolePlayerBuilder)? updates]) =>
      (new ConsolePlayerBuilder()..update(updates))._build();

  _$ConsolePlayer._(
      {this.state, this.volume, this.currentSong, this.songPosition})
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
        volume == other.volume &&
        currentSong == other.currentSong &&
        songPosition == other.songPosition;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, state.hashCode);
    _$hash = $jc(_$hash, volume.hashCode);
    _$hash = $jc(_$hash, currentSong.hashCode);
    _$hash = $jc(_$hash, songPosition.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ConsolePlayer')
          ..add('state', state)
          ..add('volume', volume)
          ..add('currentSong', currentSong)
          ..add('songPosition', songPosition))
        .toString();
  }
}

class ConsolePlayerBuilder
    implements Builder<ConsolePlayer, ConsolePlayerBuilder> {
  _$ConsolePlayer? _$v;

  PlayerState? _state;
  PlayerState? get state => _$this._state;
  set state(PlayerState? state) => _$this._state = state;

  int? _volume;
  int? get volume => _$this._volume;
  set volume(int? volume) => _$this._volume = volume;

  ConsolePlayerCurrentSongBuilder? _currentSong;
  ConsolePlayerCurrentSongBuilder get currentSong =>
      _$this._currentSong ??= new ConsolePlayerCurrentSongBuilder();
  set currentSong(ConsolePlayerCurrentSongBuilder? currentSong) =>
      _$this._currentSong = currentSong;

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
      _volume = $v.volume;
      _currentSong = $v.currentSong?.toBuilder();
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
              volume: volume,
              currentSong: _currentSong?.build(),
              songPosition: songPosition);
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
