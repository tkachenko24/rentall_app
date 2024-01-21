import 'package:foundation/export.dart';
import 'package:rental_app/common/helpers/export.dart';

class InputString extends ValueAbstract<String> {
  @override
  final Try<ValidateFailure, String> value;

  factory InputString(String input) {
    return InputString.create(
      validateStringNotEmpty(input),
    );
  }

  const InputString.create(this.value);
}
