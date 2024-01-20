import 'package:foundation/export.dart';
import 'package:rental_app/common/helpers/export.dart';

Try<ValidateFailure, String> validateStringNotEmpty(String input) {
  if (input.isNotEmpty) {
    return Try.success(input);
  } else {
    return Try.failed(const EmptyFailure());
  }
}
