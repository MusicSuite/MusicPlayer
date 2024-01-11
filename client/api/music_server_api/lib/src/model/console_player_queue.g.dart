// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'console_player_queue.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ConsolePlayerQueue extends ConsolePlayerQueue {
  @override
  final BuiltList<Song>? queue;

  factory _$ConsolePlayerQueue(
          [void Function(ConsolePlayerQueueBuilder)? updates]) =>
      (new ConsolePlayerQueueBuilder()..update(updates))._build();

  _$ConsolePlayerQueue._({this.queue}) : super._();

  @override
  ConsolePlayerQueue rebuild(
          void Function(ConsolePlayerQueueBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConsolePlayerQueueBuilder toBuilder() =>
      new ConsolePlayerQueueBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConsolePlayerQueue && queue == other.queue;
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
    return (newBuiltValueToStringHelper(r'ConsolePlayerQueue')
          ..add('queue', queue))
        .toString();
  }
}

class ConsolePlayerQueueBuilder
    implements
        Builder<ConsolePlayerQueue, ConsolePlayerQueueBuilder>,
        MusicQueueBuilder {
  _$ConsolePlayerQueue? _$v;

  ListBuilder<Song>? _queue;
  ListBuilder<Song> get queue => _$this._queue ??= new ListBuilder<Song>();
  set queue(covariant ListBuilder<Song>? queue) => _$this._queue = queue;

  ConsolePlayerQueueBuilder() {
    ConsolePlayerQueue._defaults(this);
  }

  ConsolePlayerQueueBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _queue = $v.queue?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ConsolePlayerQueue other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ConsolePlayerQueue;
  }

  @override
  void update(void Function(ConsolePlayerQueueBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ConsolePlayerQueue build() => _build();

  _$ConsolePlayerQueue _build() {
    _$ConsolePlayerQueue _$result;
    try {
      _$result = _$v ?? new _$ConsolePlayerQueue._(queue: _queue?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'queue';
        _queue?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ConsolePlayerQueue', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
