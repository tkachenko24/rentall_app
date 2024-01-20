import 'package:foundation/export.dart';
import 'package:rental_app/common/helpers/export.dart';

abstract class ValueAbstract<T> extends Equatable {
  const ValueAbstract();

  Try<ValidateFailure, T> get value;

  T getOrCrash() => value.fold<T>(
        (failure) => throw UnexpectedError(failure),
        (success) => success,
      );

  T getOrElse(T other) => value.getOrElse(() => other);

  Try<ValidateFailure, Unit> get failureOrUnit {
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
