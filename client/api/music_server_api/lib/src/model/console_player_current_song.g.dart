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
  final String artist;
  @override
  final num duration;
  @override
  final String thumbnailFileName;

  factory _$ConsolePlayerCurrentSong(
          [void Function(ConsolePlayerCurrentSongBuilder)? updates]) =>
      (new ConsolePlayerCurrentSongBuilder()..update(updates))._build();

  _$ConsolePlayerCurrentSong._(
      {required this.id,
      required this.title,
      required this.artist,
      required this.duration,
      required this.thumbnailFileName})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        id, r'ConsolePlayerCurrentSong', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'ConsolePlayerCurrentSong', 'title');
    BuiltValueNullFieldError.checkNotNull(
        artist, r'ConsolePlayerCurrentSong', 'artist');
    BuiltValueNullFieldError.checkNotNull(
        duration, r'ConsolePlayerCurrentSong', 'duration');
    BuiltValueNullFieldError.checkNotNull(
        thumbnailFileName, r'ConsolePlayerCurrentSong', 'thumbnailFileName');
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
        artist == other.artist &&
        duration == other.duration &&
        thumbnailFileName == other.thumbnailFileName;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, artist.hashCode);
    _$hash = $jc(_$hash, duration.hashCode);
    _$hash = $jc(_$hash, thumbnailFileName.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ConsolePlayerCurrentSong')
          ..add('id', id)
          ..add('title', title)
          ..add('artist', artist)
          ..add('duration', duration)
          ..add('thumbnailFileName', thumbnailFileName))
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

  String? _artist;
  String? get artist => _$this._artist;
  set artist(covariant String? artist) => _$this._artist = artist;

  num? _duration;
  num? get duration => _$this._duration;
  set duration(covariant num? duration) => _$this._duration = duration;

  String? _thumbnailFileName;
  String? get thumbnailFileName => _$this._thumbnailFileName;
  set thumbnailFileName(covariant String? thumbnailFileName) =>
      _$this._thumbnailFileName = thumbnailFileName;

  ConsolePlayerCurrentSongBuilder() {
    ConsolePlayerCurrentSong._defaults(this);
  }

  ConsolePlayerCurrentSongBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _title = $v.title;
      _artist = $v.artist;
      _duration = $v.duration;
      _thumbnailFileName = $v.thumbnailFileName;
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
            artist: BuiltValueNullFieldError.checkNotNull(
                artist, r'ConsolePlayerCurrentSong', 'artist'),
            duration: BuiltValueNullFieldError.checkNotNull(
                duration, r'ConsolePlayerCurrentSong', 'duration'),
            thumbnailFileName: BuiltValueNullFieldError.checkNotNull(
                thumbnailFileName,
                r'ConsolePlayerCurrentSong',
                'thumbnailFileName'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
