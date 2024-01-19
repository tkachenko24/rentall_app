import 'package:rental_app/common/export.dart';
import 'package:foundation/export.dart';
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
    on<SignUpCountryChanged>(_onCountryChanged);
    on<SignUpSubmitted>(_onSubmitted);
  }

  void _onEmailChanged(
    SignUpEmailChanged event,
    Emitter<SignUpState> emit,
  ) {
    emit(state.copyWith(
      status: Status.empty(),
      email: event.email,
    ));
  }

  void _onCountryChanged(
    SignUpCountryChanged event,
    Emitter<SignUpState> emit,
  ) {
    emit(state.copyWith(
      status: Status.empty(),
      country: event.country,
    ));
  }

  void _onPasswordChanged(
    SignUpPasswordChanged event,
    Emitter<SignUpState> emit,
  ) {
    emit(state.copyWith(
      status: Status.empty(),
      password: event.password,
    ));
  }

  void _onSubmitted(
    SignUpSubmitted event,
    Emitter<SignUpState> emit,
  ) async {
    emit(state.copyWith(
      status: Status.loading(),
    ));

    final credential = SignUp(
      password: state.password,
      username: state.email,
    );

    final Try<ClientFailure, Unit> response = await signUp(credential);

    emit(state.copyWith(
      status: response.fold(Status.failed, Status.success),
    ));
  }
}
