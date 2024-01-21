import 'package:rental_app/common/helpers/export.dart';

class FieldInput<T extends ValueAbstract> extends ValueAbstract {
  final T _input;

  final bool obscuring;

  final bool validate;

  const FieldInput(
    this._input, {
    this.obscuring = false,
    this.validate = false,
  });

  FieldInput<T> copyWith({
    T? value,
    bool? validate,
    bool? obscuring,
  }) {
    return FieldInput(
      value ?? _input,
      validate: validate ?? this.validate,
      obscuring: obscuring ?? this.obscuring,
    );
  }

  @override
  get value => _input.value;

  bool isObscuring() => obscuring;

  bool isEnabledValidator() => validate;

  T input() => _input;

  W? check<W>(Validate action) {
    return value.fold<W?>(
      (failed) => failed.check(action),
      (success) => null,
    );
  }

  @override
  List<Object?> get props => [_input, obscuring, validate];
}
