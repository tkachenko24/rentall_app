import 'package:rental_app/common/export.dart';
import 'package:foundation/export.dart' hide Input;
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
    on<SignInSubmitted>(_onSubmitted);
  }

  void _onEmailChanged(
    SignInEmailChanged event,
    Emitter<SignInState> emit,
  ) {
    emit(state.copyWith(
      status: Status.empty(),
      email: Input(EmailAddress(event.email)),
    ));
  }

  void _onPasswordChanged(
    SignInPasswordChanged event,
    Emitter<SignInState> emit,
  ) {
    emit(state.copyWith(
      status: Status.empty(),
      password: Input(Password(event.password)),
    ));
  }

  void _onSubmitted(
    SignInSubmitted event,
    Emitter<SignInState> emit,
  ) async {
    emit(state.copyWith(
      status: Status.loading(),
    ));

    bool isEmailValid = state.email.isValid();
    bool isPasswordValid = state.password.isValid();

    if (!isEmailValid || !isPasswordValid) {
      emit(state.copyWith(
          email: state.email.copyWith(validate: !isEmailValid),
          password: state.password.copyWith(validate: !isPasswordValid),
          status: Status.empty()));
      return;
    }

    final credential = SignIn(
      password: state.password.getOrElse(''),
      username: state.email.getOrElse(''),
    );

    final Try<ClientFailure, Unit> response = await signIn(credential);

    emit(state.copyWith(
      status: response.fold(Status.failed, Status.success),
    ));
  }
}
