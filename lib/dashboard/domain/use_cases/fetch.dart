import 'package:foundation/export.dart';
import 'package:rental_app/dashboard/export.dart';

abstract class FetchCarsUseCase
    extends UseCase<Car, Try<DataBaseFailure, List<Car>>> {}

class FetchCarsUseCaseImplementation extends FetchCarsUseCase {
  final CarsRepository repository;

  FetchCarsUseCaseImplementation({required this.repository});

  @override
  Stream<Try<DataBaseFailure, List<Car>>> execute(Car input) async* {
    yield await repository.fetch();
  }
}
