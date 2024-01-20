import 'package:foundation/export.dart';
import 'package:rental_app/common/helpers/export.dart';

Try<ValidateFailure, String> validatePassword(String input) {
  const regex =
      r'^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9].*[0-9].*[0-9])(?=.*[^A-Za-z0-9]).{8,}$';

  if (RegExp(regex).hasMatch(input)) {
    return Try.success(input);
  }
  return Try.failed(const PasswordFailure());
}
