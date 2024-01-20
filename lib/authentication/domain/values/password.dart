import 'package:foundation/export.dart';
import 'package:rental_app/common/helpers/export.dart';

class Password extends ValueAbstract<String> {
  @override
  final Try<ValidateFailure, String> value;

  factory Password(String input) {
    return Password._(
      validatePassword(input),
    );
  }

  const Password._(this.value);
}
