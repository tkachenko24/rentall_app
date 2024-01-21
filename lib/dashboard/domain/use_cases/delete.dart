import 'package:foundation/export.dart';
import 'package:rental_app/dashboard/export.dart';

abstract class DeleteCarUseCase
    extends UseCase<int, Try<DataBaseFailure, List<Car>>> {}

class DeleteCarUseCaseImplementation extends DeleteCarUseCase {
  final CarsRepository repository;

  DeleteCarUseCaseImplementation({required this.repository});

  @override
  Stream<Try<DataBaseFailure, List<Car>>> execute(int input) async* {
    yield await repository.delete(input);
  }
}
