import 'package:foundation/export.dart';
import 'package:rental_app/authentication/export.dart';

abstract class SignOutUseCase extends UseCase<Empty, dynamic> {}

class SignOutUseCaseImplementation extends SignOutUseCase {
  final SignOutRepository repository;

  SignOutUseCaseImplementation({
    required this.repository,
  });

  @override
  Stream<dynamic> execute(Empty input) async* {
    yield await repository.signOut();
  }
}
