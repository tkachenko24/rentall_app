import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rental_app/bootstrap/modules/export.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'injectable.dart';

import 'package:rental_app/authentication/export.dart';

class AuthenticationInjectable extends Injectable {
  static String dio = 'AUTHENTICATION-DIO';

  @override
  Future<void> register(GetIt it) async {
    it.registerLazySingleton<Dio>(
      () {
        Dio public = it.get<Dio>();
        Dio dio = Network.clone(public);
        return dio;
      },
      instanceName: dio,
    );

    it.registerLazySingleton<FirebaseAuth>(
      () {
        return FirebaseAuth.instance;
      },
    );

    // it.registerLazySingletonAsync<SharedPreferences>(
    //     () => SharedPreferences.getInstance());

    // it.registerLazySingleton<TokenLocale>(
    //   () {
    //     return TokenSharedPreferencesImplementation(
    //       storage: it.get(),
    //       mapper: TokenMapToTokenEntityMapper(),
    //     );
    //   },
    // );

    it.registerLazySingleton<TokenLocale>(
      () {
        return TokenFlutterSecureStorageImplementation(
          storage: const FlutterSecureStorage(),
          mapper: TokenMapToTokenEntityMapper(),
        );
      },
    );

    // it.registerLazySingleton<TokenLocale>(
    //   () {
    //     return TokenFirebaseImplementation(
    //       storage: it.get(),
    //       mapper: TokenMapToTokenEntityMapper(),
    //     );
    //   },
    // );

    it.registerLazySingleton<SignInWithCredentialsRemote>(
      () {
        return SignInWithCredentialsDioImplementation(
          client: it.get(),
        );
      },
    );

    it.registerLazySingleton<SignUpWithCredentialsRemote>(
      () {
        return SignUpWithCredentialsDioImplementation(
          client: it.get(),
        );
      },
    );

    it.registerLazySingleton<SignUpWithCredentialsRepository>(
      () {
        return SignUpWithCredentialsImplementation(
          remote: it.get(),
          locale: it.get(),
        );
      },
    );

    it.registerLazySingleton<SignInWithCredentialsRepository>(
      () {
        return SignInWithCredentialsImplementation(
          remote: it.get(),
          locale: it.get(),
        );
      },
    );

    it.registerLazySingleton<CheckSignedInRepository>(
      () {
        return CheckSignedInImplementation(
          locale: it.get(),
        );
      },
    );

    it.registerLazySingleton<SignOutRepository>(
      () {
        return SignOutImplementation(
          locale: it.get(),
        );
      },
    );

    it.registerLazySingleton<CheckSignedInUseCase>(
      () {
        return CheckSignedInUseCaseImplementation(
          repository: it.get(),
        );
      },
    );

    it.registerLazySingleton<SignUpUseCase>(
      () {
        return SignUpUseCaseImplementation(
          repository: it.get(),
        );
      },
    );

    it.registerLazySingleton<SignInUseCase>(
      () {
        return SignInUseCaseImplementation(
          repository: it.get(),
        );
      },
    );

    it.registerLazySingleton<SignOutUseCase>(
      () {
        return SignOutUseCaseImplementation(
          repository: it.get(),
        );
      },
    );
  }
}
