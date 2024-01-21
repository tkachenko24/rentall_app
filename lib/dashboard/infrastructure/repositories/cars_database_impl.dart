import 'package:foundation/export.dart';
import 'package:rental_app/dashboard/export.dart';
import 'package:rental_app/dashboard/infrastructure/sources/cars_database/export.dart';

class CarsRepositoryImplementation implements CarsRepository {
  final CarsSource source;
  final CarConverter convert;
  CarsRepositoryImplementation({
    required this.source,
    required this.convert,
  });

  @override
  TryFuture<DataBaseFailure, List<Car>> fetch() async {
    try {
      List<CarModel> response = await source.fetch();
      List<Car> unit =
          response.map((model) => convert.toEntity(model)).toList();
      return Try.success(unit);
    } catch (err) {
      return Try.failed(
        DataBaseFailure(
          description: err.toString(),
        ),
      );
    }
  }

  @override
  TryFuture<DataBaseFailure, List<Car>> delete(int index) async {
    try {
      List<CarModel> response = await source.delete(index);
      List<Car> unit =
          response.map((model) => convert.toEntity(model)).toList();
      return Try.success(unit);
    } catch (err) {
      return Try.failed(
        DataBaseFailure(
          description: err.toString(),
        ),
      );
    }
  }

  @override
  TryFuture<DataBaseFailure, List<Car>> add({required Car car}) async {
    try {
      List<CarModel> response = await source.add(value: convert.toModel(car));
      List<Car> unit =
          response.map((model) => convert.toEntity(model)).toList();
      return Try.success(unit);
    } catch (err) {
      return Try.failed(
        DataBaseFailure(
          description: err.toString(),
        ),
      );
    }
  }

  @override
  TryFuture<DataBaseFailure, List<Car>> edit(
      {required Car car, required int index}) async {
    try {
      List<CarModel> response =
          await source.edit(value: convert.toModel(car), index: index);
      List<Car> unit =
          response.map((model) => convert.toEntity(model)).toList();
      return Try.success(unit);
    } catch (err) {
      return Try.failed(
        DataBaseFailure(
          description: err.toString(),
        ),
      );
    }
  }
}
