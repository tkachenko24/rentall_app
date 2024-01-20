import 'package:rental_app/common/helpers/export.dart';

class Input<T extends ValueAbstract> extends ValueAbstract {
  final T _input;

  final bool obscuring;

  final bool validate;

  const Input(
    this._input, {
    this.obscuring = false,
    this.validate = false,
  });

  Input<T> copyWith({
    T? value,
    bool? validate,
    bool? obscuring,
  }) {
    return Input(
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
