import 'dart:async';

import 'package:foundation/export.dart';

abstract class SystemUseCase extends UseCase<Empty, System> {}

class SystemUseCaseImplementation extends SystemUseCase {
  final SystemRepository repository;

  SystemUseCaseImplementation({
    required this.repository,
  });

  @override
  Stream<System> execute(input) async* {
    yield await repository.load();
  }
}
