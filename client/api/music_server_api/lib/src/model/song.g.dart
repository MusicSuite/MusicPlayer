// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Song extends Song {
  @override
  final int id;
  @override
  final String title;
  @override
  final num duration;

  factory _$Song([void Function(SongBuilder)? updates]) =>
      (new SongBuilder()..update(updates))._build();

  _$Song._({required this.id, required this.title, required this.duration})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'Song', 'id');
    BuiltValueNullFieldError.checkNotNull(title, r'Song', 'title');
    BuiltValueNullFieldError.checkNotNull(duration, r'Song', 'duration');
  }

  @override
  Song rebuild(void Function(SongBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SongBuilder toBuilder() => new SongBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Song &&
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
    return (newBuiltValueToStringHelper(r'Song')
          ..add('id', id)
          ..add('title', title)
          ..add('duration', duration))
        .toString();
  }
}

class SongBuilder implements Builder<Song, SongBuilder> {
  _$Song? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  num? _duration;
  num? get duration => _$this._duration;
  set duration(num? duration) => _$this._duration = duration;

  SongBuilder() {
    Song._defaults(this);
  }

  SongBuilder get _$this {
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
  void replace(Song other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Song;
  }

  @override
  void update(void Function(SongBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Song build() => _build();

  _$Song _build() {
    final _$result = _$v ??
        new _$Song._(
            id: BuiltValueNullFieldError.checkNotNull(id, r'Song', 'id'),
            title:
                BuiltValueNullFieldError.checkNotNull(title, r'Song', 'title'),
            duration: BuiltValueNullFieldError.checkNotNull(
                duration, r'Song', 'duration'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
