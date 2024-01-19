import 'package:foundation/export.dart';
import 'package:rental_app/authentication/export.dart';
import 'package:rental_app/common/export.dart';

abstract class SignInUseCase
    extends UseCase<SignIn, Try<ClientFailure, Unit>> {}

class SignInUseCaseImplementation extends SignInUseCase {
  final SignInWithCredentialsRepository repository;

  SignInUseCaseImplementation({
    required this.repository,
  });

  @override
  Stream<Try<ClientFailure, Unit>> execute(SignIn input) async* {
    yield await repository.signIn(input);
  }
}
