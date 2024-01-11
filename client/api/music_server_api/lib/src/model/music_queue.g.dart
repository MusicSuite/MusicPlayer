// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_queue.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

abstract class MusicQueueBuilder {
  void replace(MusicQueue other);
  void update(void Function(MusicQueueBuilder) updates);
  ListBuilder<Song> get queue;
  set queue(ListBuilder<Song>? queue);
}

class _$$MusicQueue extends $MusicQueue {
  @override
  final BuiltList<Song>? queue;

  factory _$$MusicQueue([void Function($MusicQueueBuilder)? updates]) =>
      (new $MusicQueueBuilder()..update(updates))._build();

  _$$MusicQueue._({this.queue}) : super._();

  @override
  $MusicQueue rebuild(void Function($MusicQueueBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  $MusicQueueBuilder toBuilder() => new $MusicQueueBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is $MusicQueue && queue == other.queue;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, queue.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'$MusicQueue')..add('queue', queue))
        .toString();
  }
}

class $MusicQueueBuilder
    implements Builder<$MusicQueue, $MusicQueueBuilder>, MusicQueueBuilder {
  _$$MusicQueue? _$v;

  ListBuilder<Song>? _queue;
  ListBuilder<Song> get queue => _$this._queue ??= new ListBuilder<Song>();
  set queue(covariant ListBuilder<Song>? queue) => _$this._queue = queue;

  $MusicQueueBuilder() {
    $MusicQueue._defaults(this);
  }

  $MusicQueueBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _queue = $v.queue?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant $MusicQueue other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$$MusicQueue;
  }

  @override
  void update(void Function($MusicQueueBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  $MusicQueue build() => _build();

  _$$MusicQueue _build() {
    _$$MusicQueue _$result;
    try {
      _$result = _$v ?? new _$$MusicQueue._(queue: _queue?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'queue';
        _queue?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'$MusicQueue', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
