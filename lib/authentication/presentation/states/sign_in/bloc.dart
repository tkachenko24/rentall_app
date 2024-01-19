import 'package:rental_app/common/export.dart';
import 'package:foundation/export.dart';
import 'package:rental_app/authentication/export.dart';

part 'event.dart';
part 'state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SignInUseCase signIn;

  SignInBloc({
    required this.signIn,
  }) : super(SignInState.empty()) {
    on<SignInEmailChanged>(_onEmailChanged);
    on<SignInPasswordChanged>(_onPasswordChanged);
    on<SignInCaptchaChanged>(_onCaptchaChanged);
    on<SignInSubmitted>(_onSubmitted);
  }

  void _onEmailChanged(
    SignInEmailChanged event,
    Emitter<SignInState> emit,
  ) {
    emit(state.copyWith(
      status: Status.empty(),
      email: event.email,
    ));
  }

  void _onCaptchaChanged(
    SignInCaptchaChanged event,
    Emitter<SignInState> emit,
  ) {
    emit(state.copyWith(
      status: Status.empty(),
      captcha: event.captcha,
    ));
  }

  void _onPasswordChanged(
    SignInPasswordChanged event,
    Emitter<SignInState> emit,
  ) {
    emit(state.copyWith(
      status: Status.empty(),
      password: event.password,
    ));
  }

  void _onSubmitted(
    SignInSubmitted event,
    Emitter<SignInState> emit,
  ) async {
    emit(state.copyWith(
      status: Status.loading(),
    ));

    final credential = SignIn(
      password: state.password,
      username: state.email,
    );

    final Try<ClientFailure, Unit> response = await signIn(credential);

    emit(state.copyWith(
      status: response.fold(Status.failed, Status.success),
    ));
  }
}
