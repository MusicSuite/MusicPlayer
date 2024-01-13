// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'console_player_current_song.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ConsolePlayerCurrentSong extends ConsolePlayerCurrentSong {
  @override
  final int id;
  @override
  final String title;
  @override
  final num duration;

  factory _$ConsolePlayerCurrentSong(
          [void Function(ConsolePlayerCurrentSongBuilder)? updates]) =>
      (new ConsolePlayerCurrentSongBuilder()..update(updates))._build();

  _$ConsolePlayerCurrentSong._(
      {required this.id, required this.title, required this.duration})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        id, r'ConsolePlayerCurrentSong', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'ConsolePlayerCurrentSong', 'title');
    BuiltValueNullFieldError.checkNotNull(
        duration, r'ConsolePlayerCurrentSong', 'duration');
  }

  @override
  ConsolePlayerCurrentSong rebuild(
          void Function(ConsolePlayerCurrentSongBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConsolePlayerCurrentSongBuilder toBuilder() =>
      new ConsolePlayerCurrentSongBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConsolePlayerCurrentSong &&
        id == other.id &&
        title == other.title &&
        duration == other.duration;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, duration.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ConsolePlayerCurrentSong')
          ..add('id', id)
          ..add('title', title)
          ..add('duration', duration))
        .toString();
  }
}

class ConsolePlayerCurrentSongBuilder
    implements
        Builder<ConsolePlayerCurrentSong, ConsolePlayerCurrentSongBuilder>,
        SongBuilder {
  _$ConsolePlayerCurrentSong? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(covariant int? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(covariant String? title) => _$this._title = title;

  num? _duration;
  num? get duration => _$this._duration;
  set duration(covariant num? duration) => _$this._duration = duration;

  ConsolePlayerCurrentSongBuilder() {
    ConsolePlayerCurrentSong._defaults(this);
  }

  ConsolePlayerCurrentSongBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _title = $v.title;
      _duration = $v.duration;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ConsolePlayerCurrentSong other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ConsolePlayerCurrentSong;
  }

  @override
  void update(void Function(ConsolePlayerCurrentSongBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ConsolePlayerCurrentSong build() => _build();

  _$ConsolePlayerCurrentSong _build() {
    final _$result = _$v ??
        new _$ConsolePlayerCurrentSong._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'ConsolePlayerCurrentSong', 'id'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'ConsolePlayerCurrentSong', 'title'),
            duration: BuiltValueNullFieldError.checkNotNull(
                duration, r'ConsolePlayerCurrentSong', 'duration'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
