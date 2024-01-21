import 'dart:async';

import 'package:rental_app/dashboard/infrastructure/sources/cars_database/models/export.dart';

abstract class CarsSource {
  Future<List<CarModel>> fetch();

  Future<List<CarModel>> delete(int index);

  Future<List<CarModel>> add({required CarModel value});

  Future<List<CarModel>> edit({
    required CarModel value,
    required int index,
  });
}
