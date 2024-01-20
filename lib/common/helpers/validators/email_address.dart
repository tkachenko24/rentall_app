import 'package:foundation/export.dart';
import 'package:rental_app/common/helpers/export.dart';

Try<ValidateFailure, String> validateEmailAddress(String input) {
  const regex =
      r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";

  if (RegExp(regex).hasMatch(input)) {
    return Try.success(input);
  }
  return Try.failed(const EmailFailure());
}
