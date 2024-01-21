import 'package:foundation/export.dart';
import 'package:rental_app/dashboard/export.dart';

abstract class EditCarUseCase
    extends UseCase<List, Try<DataBaseFailure, List<Car>>> {}

class EditCarUseCaseUseCaseImplementation extends EditCarUseCase {
  final CarsRepository repository;

  EditCarUseCaseUseCaseImplementation({required this.repository});

  @override
  Stream<Try<DataBaseFailure, List<Car>>> execute(List input) async* {
    yield await repository.edit(car: input.first, index: input.last);
  }
}
