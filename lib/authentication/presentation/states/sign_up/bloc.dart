import 'package:rental_app/common/export.dart';
import 'package:foundation/export.dart' hide Input;
import 'package:rental_app/authentication/export.dart';

part 'event.dart';
part 'state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUpUseCase signUp;

  SignUpBloc({
    required this.signUp,
  }) : super(SignUpState.empty()) {
    on<SignUpEmailChanged>(_onEmailChanged);
    on<SignUpPasswordChanged>(_onPasswordChanged);
    on<SignUpSubmitted>(_onSubmitted);
  }

  void _onEmailChanged(
    SignUpEmailChanged event,
    Emitter<SignUpState> emit,
  ) {
    emit(state.copyWith(
      status: Status.empty(),
      email: Input(EmailAddress(event.email)),
    ));
  }

  void _onPasswordChanged(
    SignUpPasswordChanged event,
    Emitter<SignUpState> emit,
  ) {
    emit(state.copyWith(
      status: Status.empty(),
      password: Input(Password(event.password)),
    ));
  }

  void _onSubmitted(
    SignUpSubmitted event,
    Emitter<SignUpState> emit,
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

    final credential = SignUp(
      password: state.password.getOrElse(''),
      username: state.email.getOrElse(''),
    );

    final Try<ClientFailure, Unit> response = await signUp(credential);

    emit(state.copyWith(
      status: response.fold(Status.failed, Status.success),
    ));
  }
}
