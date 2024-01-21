import 'dart:async';

import 'package:rental_app/dashboard/infrastructure/sources/cars_database/export.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CarsDatabaseSharedPreferencesImplementation implements CarsSource {
  final SharedPreferences storage;
  final CarConverter convert;

  String get key => 'cars';

  CarsDatabaseSharedPreferencesImplementation({
    required this.storage,
    required this.convert,
  });

  @override
  Future<List<CarModel>> add({required CarModel value}) async {
    List<String> oldStorageList = storage.getStringList(key) ?? [];
    oldStorageList.add(convert.toMapString(value));
    storage.setStringList(key, oldStorageList);
    return fetch();
  }

  @override
  Future<List<CarModel>> edit(
      {required CarModel value, required int index}) async {
    List<String> oldStorageList = storage.getStringList(key) ?? [];
    oldStorageList.removeAt(index);
    oldStorageList.insert(index, convert.toMapString(value));
    storage.setStringList(key, oldStorageList);
    return fetch();
  }

  @override
  Future<List<CarModel>> delete(int index) async {
    List<String> oldStorageList = storage.getStringList(key) ?? [];
    oldStorageList.removeAt(index);
    storage.setStringList(key, oldStorageList);
    return fetch();
  }

  @override
  Future<List<CarModel>> fetch() async {
    List<String> rawList = storage.getStringList(key) ?? [];
    List<CarModel> doneList =
        rawList.map((e) => convert.fromMapString(e)).toList();
    return doneList;
  }
}
