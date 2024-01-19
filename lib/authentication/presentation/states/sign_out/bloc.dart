import 'package:rental_app/common/export.dart';
import 'package:foundation/export.dart';
import 'package:rental_app/authentication/export.dart';

part 'event.dart';
part 'state.dart';

class SignOutBloc extends Bloc<SignOutEvent, SignOutState> {
  final SignOutUseCase signOut;

  SignOutBloc({
    required this.signOut,
  }) : super(SignOutState.empty()) {
    on<SignOutSubmitted>(_onSubmitted);
  }

  void _onSubmitted(
    SignOutSubmitted event,
    Emitter<SignOutState> emit,
  ) async {
    emit(state.copyWith(
      status: Status.loading(),
    ));

    final Try<ClientFailure, Unit> response = await signOut(Empty());

    emit(state.copyWith(
      status: response.fold(Status.failed, Status.success),
    ));
  }
}
