part of 'bloc.dart';

class SignUpState extends Equatable {
  final String email;
  final String password;
  final Status<ClientFailure, Unit> status;

  const SignUpState({
    required this.email,
    required this.password,
    required this.status,
  });

  factory SignUpState.empty() => SignUpState(
        email: 'eve.holt@reqres.in',
        password: 'pistol',
        status: Status.empty(),
      );

  SignUpState copyWith({
    String? email,
    String? password,
    String? country,
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
