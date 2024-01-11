// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'body_rename_songs_replace_put.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$BodyRenameSongsReplacePut extends BodyRenameSongsReplacePut {
  @override
  final Song oldSong;
  @override
  final Song newSong;

  factory _$BodyRenameSongsReplacePut(
          [void Function(BodyRenameSongsReplacePutBuilder)? updates]) =>
      (new BodyRenameSongsReplacePutBuilder()..update(updates))._build();

  _$BodyRenameSongsReplacePut._({required this.oldSong, required this.newSong})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        oldSong, r'BodyRenameSongsReplacePut', 'oldSong');
    BuiltValueNullFieldError.checkNotNull(
        newSong, r'BodyRenameSongsReplacePut', 'newSong');
  }

  @override
  BodyRenameSongsReplacePut rebuild(
          void Function(BodyRenameSongsReplacePutBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BodyRenameSongsReplacePutBuilder toBuilder() =>
      new BodyRenameSongsReplacePutBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BodyRenameSongsReplacePut &&
        oldSong == other.oldSong &&
        newSong == other.newSong;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, oldSong.hashCode);
    _$hash = $jc(_$hash, newSong.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BodyRenameSongsReplacePut')
          ..add('oldSong', oldSong)
          ..add('newSong', newSong))
        .toString();
  }
}

class BodyRenameSongsReplacePutBuilder
    implements
        Builder<BodyRenameSongsReplacePut, BodyRenameSongsReplacePutBuilder> {
  _$BodyRenameSongsReplacePut? _$v;

  SongBuilder? _oldSong;
  SongBuilder get oldSong => _$this._oldSong ??= new SongBuilder();
  set oldSong(SongBuilder? oldSong) => _$this._oldSong = oldSong;

  SongBuilder? _newSong;
  SongBuilder get newSong => _$this._newSong ??= new SongBuilder();
  set newSong(SongBuilder? newSong) => _$this._newSong = newSong;

  BodyRenameSongsReplacePutBuilder() {
    BodyRenameSongsReplacePut._defaults(this);
  }

  BodyRenameSongsReplacePutBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _oldSong = $v.oldSong.toBuilder();
      _newSong = $v.newSong.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BodyRenameSongsReplacePut other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BodyRenameSongsReplacePut;
  }

  @override
  void update(void Function(BodyRenameSongsReplacePutBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BodyRenameSongsReplacePut build() => _build();

  _$BodyRenameSongsReplacePut _build() {
    _$BodyRenameSongsReplacePut _$result;
    try {
      _$result = _$v ??
          new _$BodyRenameSongsReplacePut._(
              oldSong: oldSong.build(), newSong: newSong.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'oldSong';
        oldSong.build();
        _$failedField = 'newSong';
        newSong.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'BodyRenameSongsReplacePut', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
