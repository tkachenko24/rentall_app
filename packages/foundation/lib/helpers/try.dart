import 'package:meta/meta.dart';

@sealed
abstract class Try<E, S> {
  const Try();

  static Try<E, S> failed<E, S>(E failed) => TryFailed(failed);

  static Try<E, S> success<E, S>(S data) => TrySuccess(data);

  S getOrElse(S Function() other);

  bool isFailed();

  bool isSuccess();

  W fold<W>(
    W Function(E failed) failed,
    W Function(S success) success,
  );

  Try<TE, TS> either<TE, TS>(
    TE Function(E failed) failed,
    TS Function(S success) success,
  );

  Try<E, W> then<W>(Try<E, W> action);

  Try<E, W> map<W>(W Function(S data) action);

  Try<E, W> flat<W>(Try<E, W> Function(S success) action) {
    return fold((failed) => Try.failed<E, W>(failed), action);
  }

  bool every(bool Function(S success) action) {
    return fold((failed) => false, action);
  }

  @override
  String toString() {
    return fold((l) => 'Failed($l)', (r) => 'Success($r)');
  }

  Try<S, E> swap() {
    return fold(
      (failed) => Try.success(failed),
      (success) => Try.failed(success),
    );
  }
}

@immutable
class TrySuccess<E, S> extends Try<E, S> {
  const TrySuccess(
    this._success,
  );

  final S _success;

  @override
  bool isFailed() => false;

  @override
  bool isSuccess() => true;

  @override
  int get hashCode => _success.hashCode;

  @override
  bool operator ==(Object other) =>
      other is TrySuccess && other._success == _success;

  @override
  S getOrElse(Function() other) => _success;

  @override
  W fold<W>(
    W Function(E failed) failed,
    W Function(S success) success,
  ) {
    return success(_success);
  }

  @override
  Try<TE, TS> either<TE, TS>(
    TE Function(E failed) failed,
    TS Function(S success) success,
  ) {
    return Try.success<TE, TS>(success(_success));
  }

  @override
  Try<E, W> then<W>(Try<E, W> action) {
    return action;
  }

  @override
  Try<E, W> map<W>(W Function(S data) action) {
    return Try.success(action(_success));
  }
}

@immutable
class TryFailed<E, S> extends Try<E, S> {
  const TryFailed(this._failed);

  final E _failed;

  @override
  bool isFailed() => true;

  @override
  bool isSuccess() => false;

  @override
  int get hashCode => _failed.hashCode;

  @override
  bool operator ==(Object other) =>
      other is TryFailed && other._failed == _failed;

  @override
  W fold<W>(
    W Function(E failed) failed,
    W Function(S success) success,
  ) {
    return failed(_failed);
  }

  @override
  Try<TE, TS> either<TE, TS>(
    TE Function(E failed) failed,
    TS Function(S success) success,
  ) {
    return Try.failed<TE, TS>(failed(_failed));
  }

  @override
  S getOrElse(Function() other) => other();

  @override
  Try<E, W> then<W>(Try<E, W> action) {
    return Try.failed(_failed);
  }

  @override
  Try<E, W> map<W>(W Function(S data) action) {
    return Try.failed(_failed);
  }
}

typedef TryFuture<Failed, Success> = Future<Try<Failed, Success>>;
