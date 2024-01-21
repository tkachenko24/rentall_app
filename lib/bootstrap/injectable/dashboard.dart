import 'package:get_it/get_it.dart';
import 'package:rental_app/dashboard/export.dart';
import 'package:rental_app/dashboard/infrastructure/sources/cars_database/export.dart';
import 'injectable.dart';
import 'package:firebase_database/firebase_database.dart';

class DashboardInjectable extends Injectable {
  @override
  Future<void> register(GetIt it) async {
    // it.registerLazySingleton<FirebaseDatabase>(
    //     () => FirebaseDatabase.instanceFor(app: it.get()));

    // it.registerLazySingleton<CarsSource>(() =>
    //     CarsDatabaseFirestoreImplementation(
    //         storage: it.get(), convert: CarConverter()));

    it.registerLazySingleton<CarsSource>(() =>
        CarsDatabaseSharedPreferencesImplementation(
            storage: it.get(), convert: CarConverter()));

    it.registerLazySingleton<CarsRepository>(() => CarsRepositoryImplementation(
          source: it.get(),
          convert: CarConverter(),
        ));

    it.registerLazySingleton<AddCarUseCase>(
        () => AddCarUseCaseImplementation(repository: it.get()));

    it.registerLazySingleton<DeleteCarUseCase>(
        () => DeleteCarUseCaseImplementation(repository: it.get()));

    it.registerLazySingleton<EditCarUseCase>(
        () => EditCarUseCaseUseCaseImplementation(repository: it.get()));

    it.registerLazySingleton<FetchCarsUseCase>(
        () => FetchCarsUseCaseImplementation(repository: it.get()));
  }
}
