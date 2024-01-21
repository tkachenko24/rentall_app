import 'package:foundation/export.dart';
import 'package:rental_app/common/helpers/export.dart';

Try<ValidateFailure, String> validateNumbersOnly(String input) {
  const regex = r'^[0-9]+$';

  if (RegExp(regex).hasMatch(input)) {
    return Try.success(input);
  }
  return Try.failed(const NumbersFailure());
}
