import 'dart:async';
import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:rental_app/dashboard/infrastructure/sources/cars_database/export.dart';

class CarsDatabaseFirestoreImplementation implements CarsSource {
  final FirebaseDatabase storage;
  final CarConverter convert;

  String get key => 'cars';

  CarsDatabaseFirestoreImplementation({
    required this.storage,
    required this.convert,
  });

  @override
  Future<List<CarModel>> add({required CarModel value}) async {
    // List<String> oldStorageList = storage.getStringList(key) ?? [];
    // oldStorageList.add(convert.toMapString(value));
    // storage.setStringList(key, oldStorageList);
    return fetch();
  }

  @override
  Future<List<CarModel>> edit(
      {required CarModel value, required int index}) async {
    // List<String> oldStorageList = storage.getStringList(key) ?? [];
    // oldStorageList.removeAt(index);
    // oldStorageList.insert(index, convert.toMapString(value));
    // storage.setStringList(key, oldStorageList);
    return fetch();
  }

  @override
  Future<List<CarModel>> delete(int index) async {
    // List<String> oldStorageList = storage.getStringList(key) ?? [];
    // oldStorageList.removeAt(index);
    // storage.setStringList(key, oldStorageList);
    return fetch();
  }

  @override
  Future<List<CarModel>> fetch() async {
    // List<String> rawList = await storage.ref().get().then((value) {
    //   print(jsonDecode(value.value.toString()));
    //   return jsonDecode(value.value.toString());
    // });
    // var test = await storage.ref('cars').get();
    // print(test.v);

    // print(rawList);
    // List<CarModel> doneList =
    //     rawList.map((e) => convert.fromMapString(e)).toList();
    return [];

    print(storage.ref().get().then((value) => print(value.value)));
    return [];
  }
}
