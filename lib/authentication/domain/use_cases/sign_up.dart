import 'package:foundation/export.dart';
import 'package:rental_app/authentication/export.dart';
import 'package:rental_app/common/export.dart';

abstract class SignUpUseCase
    extends UseCase<SignUp, Try<ClientFailure, Unit>> {}

class SignUpUseCaseImplementation extends SignUpUseCase {
  final SignUpWithCredentialsRepository repository;

  SignUpUseCaseImplementation({
    required this.repository,
  });

  @override
  @override
  Stream<Try<ClientFailure, Unit>> execute(SignUp input) async* {
    yield await repository.signUp(input);
  }
}
