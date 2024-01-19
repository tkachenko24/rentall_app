import 'package:foundation/export.dart';
import 'package:rental_app/authentication/export.dart';

abstract class CheckSignedInUseCase extends UseCase<Empty, Authentication> {}

class CheckSignedInUseCaseImplementation extends CheckSignedInUseCase {
  final CheckSignedInRepository repository;

  CheckSignedInUseCaseImplementation({
    required this.repository,
  });

  @override
  Stream<Authentication> execute(Empty input) async* {
    yield* repository.status;
  }
}
