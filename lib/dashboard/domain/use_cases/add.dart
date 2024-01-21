import 'package:foundation/export.dart';
import 'package:rental_app/dashboard/export.dart';

abstract class AddCarUseCase
    extends UseCase<Car, Try<DataBaseFailure, List<Car>>> {}

class AddCarUseCaseImplementation extends AddCarUseCase {
  final CarsRepository repository;

  AddCarUseCaseImplementation({required this.repository});

  @override
  Stream<Try<DataBaseFailure, List<Car>>> execute(Car input) async* {
    yield await repository.add(car: input);
  }
}
