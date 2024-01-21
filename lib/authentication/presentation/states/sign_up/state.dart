part of 'bloc.dart';

class SignUpState extends Equatable {
  final FieldInput<EmailAddress> email;
  final FieldInput<Password> password;
  final Status<ClientFailure, Unit> status;

  const SignUpState({
    required this.email,
    required this.password,
    required this.status,
  });

  factory SignUpState.empty() => SignUpState(
        email: FieldInput(EmailAddress('')),
        password: FieldInput(Password(''), obscuring: true),
        status: Status.empty(),
      );

  SignUpState copyWith({
    final FieldInput<EmailAddress>? email,
    final FieldInput<Password>? password,
    Status<ClientFailure, Unit>? status,
  }) {
    return SignUpState(
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
