part of 'bloc.dart';

class SignUpState extends Equatable {
  final Input<EmailAddress> email;
  final Input<Password> password;
  final Status<ClientFailure, Unit> status;

  const SignUpState({
    required this.email,
    required this.password,
    required this.status,
  });

  factory SignUpState.empty() => SignUpState(
        email: Input(EmailAddress('')),
        password: Input(Password(''), obscuring: true),
        status: Status.empty(),
      );

  SignUpState copyWith({
    final Input<EmailAddress>? email,
    final Input<Password>? password,
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
