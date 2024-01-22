import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:rental_app/dashboard/infrastructure/sources/cars_database/export.dart';

class CarsDatabaseFirestoreImplementation implements CarsSource {
  final DatabaseReference storage;
  final CarConverter convert;

  CarsDatabaseFirestoreImplementation({
    required this.storage,
    required this.convert,
  });

  @override
  Future<List<CarModel>> add({required CarModel value}) async {
    return await fetch()
        .then((oldModelList) {
          oldModelList.add(value);
          return oldModelList;
        })
        .then((newModelList) =>
            newModelList.map((model) => convert.toMapString(model)).toList())
        .then((newStringList) => storage.set(newStringList))
        .then((v) => fetch());
  }

  //   List<CarModel> oldList = await fetch();
  // oldList.add(value);
  // List<String> listToSave =
  //     oldList.map((e) => convert.toMapString(e)).toList();
  //     List<CarModel> data = [];
  //  storage.set(listToSave).whenComplete(() =>   fetch().then((value) => data = value));

  @override
  Future<List<CarModel>> edit(
      {required CarModel value, required int index}) async {
    return await fetch()
        .then((result) {
          result.removeAt(index);
          result.insert(index, value);
          return result;
        })
        .then((modelList) =>
            modelList.map((model) => convert.toMapString(model)).toList())
        .then((listString) => storage.set(listString))
        .then((v) => fetch());
  }

  // List<CarModel> oldList = await fetch();
  // oldList.removeAt(index);
  // oldList.insert(index, value);
  // List<String> listToSave =
  //     oldList.map((e) => convert.toMapString(e)).toList();
  // await storage.set(listToSave);
  // return fetch();

  @override
  Future<List<CarModel>> delete(int index) async {
    return await fetch()
        .then((fetchResult) {
          fetchResult.removeAt(index);
          return fetchResult;
        })
        .then((listModel) =>
            listModel.map((model) => convert.toMapString(model)).toList())
        .then((listToSave) => storage.set(listToSave))
        .then((v) => fetch());
  }

  //   List<CarModel> oldList = await fetch();
  // oldList.removeAt(index);
  // List<String> listToSave =
  //     oldList.map((e) => convert.toMapString(e)).toList();
  // await storage.set(listToSave);
  // return fetch();

  @override
  Future<List<CarModel>> fetch() async {
    return storage
        .get()
        .then((result) =>
            result.value == null ? [] : result.value as List<dynamic>)
        .then((listDynamic) => listDynamic
            .map<CarModel>((model) => convert.fromMapString(model))
            .toList());
  }

  //   DataSnapshot db = await storage.get();
  // return db.value == null
  //     ? []
  //     : (db.value as List<dynamic>)
  //         .map<CarModel>((e) => convert.fromMapString(e))
  //         .toList();
}
