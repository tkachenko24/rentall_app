part of 'bloc.dart';

class SignInState extends Equatable {
  final String email;
  final String password;
  final Status<ClientFailure, Unit> status;

  const SignInState({
    required this.email,
    required this.password,
    required this.status,
  });

  factory SignInState.empty() => SignInState(
        email: 'eve.holt@reqres.in',
        password: 'cityslicka',
        status: Status.empty(),
      );

  SignInState copyWith({
    String? email,
    String? password,
    String? captcha,
    Status<ClientFailure, Unit>? status,
  }) {
    return SignInState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        email,
        password,
        status,
      ];
}
