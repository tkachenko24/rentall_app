part of 'bloc.dart';

class SignInState extends Equatable {
  final FieldInput<EmailAddress> email;
  final FieldInput<Password> password;
  final Status<ClientFailure, Unit> status;

  const SignInState({
    required this.email,
    required this.password,
    required this.status,
  });

  factory SignInState.empty() => SignInState(
        email: FieldInput(EmailAddress('')),
        password: FieldInput(Password(''), obscuring: true),
        status: Status.empty(),
      );

  SignInState copyWith({
    final FieldInput<EmailAddress>? email,
    final FieldInput<Password>? password,
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
