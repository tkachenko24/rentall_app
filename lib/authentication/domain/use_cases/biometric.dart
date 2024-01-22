import 'package:foundation/export.dart';
import 'package:rental_app/authentication/export.dart';
import 'package:rental_app/common/export.dart';

abstract class BiometricsUseCase
    extends UseCase<Empty, Try<ClientFailure, Unit>> {}

class BiometricsUseCaseImplementation extends BiometricsUseCase {
  final BiometricsRepository repository;

  BiometricsUseCaseImplementation({
    required this.repository,
  });

  @override
  Stream<Try<ClientFailure, Unit>> execute(Empty input) async* {
    yield await repository.check(input);
  }
}
