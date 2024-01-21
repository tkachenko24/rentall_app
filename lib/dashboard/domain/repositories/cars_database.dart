import 'package:foundation/export.dart';
import 'package:rental_app/dashboard/export.dart';

abstract class CarsRepository {
  TryFuture<DataBaseFailure, List<Car>> fetch();
  TryFuture<DataBaseFailure, List<Car>> delete(int idex);
  TryFuture<DataBaseFailure, List<Car>> add({required Car car});
  TryFuture<DataBaseFailure, List<Car>> edit(
      {required Car car, required int index});
}
