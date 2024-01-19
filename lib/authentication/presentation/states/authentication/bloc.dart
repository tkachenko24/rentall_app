import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foundation/export.dart';
import 'package:rental_app/authentication/export.dart';

part 'event.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, Authentication> {
  final CheckSignedInUseCase check;

  late StreamSubscription<Authentication> _statusSubscription;

  AuthenticationBloc({
    required this.check,
  }) : super(Authentication.other) {
    on<AuthenticationChanged>(_onChanged);

    _statusSubscription = check.invoke(Empty()).asBroadcastStream().listen(
      (status) {
        add(AuthenticationChanged(status));
      },
    );
  }

  Future<void> _onChanged(
    AuthenticationChanged event,
    Emitter<Authentication> emit,
  ) async {
    emit(event.status);
  }

  @override
  Future<void> close() {
    _statusSubscription.cancel();

    return super.close();
  }
}
