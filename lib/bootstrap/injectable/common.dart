import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:rental_app/firebase_options.dart';
import 'injectable.dart';

import 'package:rental_app/bootstrap/modules/export.dart';

class CommonInjectable extends Injectable {
  @override
  Future<void> register(
    GetIt it,
  ) async {
    it.registerSingletonAsync<FirebaseApp>(
      () async {
        final firebase = await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        );

        return firebase;
      },
    );

    it.registerLazySingleton<Dio>(
      () {
        return Network(
          'https://reqres.in/',
        );
      },
    );
  }
}
