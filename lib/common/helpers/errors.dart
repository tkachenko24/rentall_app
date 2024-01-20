import 'package:foundation/export.dart';

class UnexpectedError extends Error {
  final Failure failure;

  UnexpectedError(this.failure);

  @override
  String toString() {
    const explanation =
        'Encountered a Failure at an unrecoverable point. Terminating.';
    return Error.safeToString('$explanation Failure was: $failure');
  }
}
