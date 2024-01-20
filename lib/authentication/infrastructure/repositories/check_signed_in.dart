import 'dart:async';
import 'package:rental_app/authentication/export.dart';

class CheckSignedInImplementation implements CheckSignedInRepository {
  final TokenLocale locale;

  CheckSignedInImplementation({
    required this.locale,
  });

  @override
  Stream<Authentication> get status async* {
    yield* locale.status.map(
      (output) {
        return output.when(
          exist: () => Authentication.authenticated,
          empty: () => Authentication.unauthenticated,
          other: () => Authentication.unauthenticated,
        );
      },
    ).asBroadcastStream();
  }
}
