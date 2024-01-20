import 'package:foundation/export.dart';
import 'package:rental_app/common/helpers/export.dart';

Try<ValidateFailure, String> validateStringMinLength(
  String input,
  int minLength,
) {
  if (input.length >= minLength) {
    return Try.success(input);
  } else {
    return Try.failed(const MinFailure());
  }
}
