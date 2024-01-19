import 'package:foundation/export.dart';

abstract class Value<T> extends Equatable {
  const Value();

  Try<Failure, T> get value;

  T get(T other) => value.getOrElse(() => other);

  Try<Failure, Unit> get failure {
    return value.fold(
      (l) => Try.failed(l),
      (r) => Try.success(unit),
    );
  }

  bool isValid() => value.isSuccess();

  bool isNotValid() => value.isFailed();

  @override
  String toString() => 'Value<$T>($value)';

  @override
  List<Object?> get props => [value];
}
