part of 'bloc.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object?> get props => [];
}

class SignUpEmailChanged extends SignUpEvent {
  final String email;

  const SignUpEmailChanged(this.email);

  @override
  List<Object?> get props => [email];
}

class SignUpPasswordChanged extends SignUpEvent {
  final String password;

  const SignUpPasswordChanged(this.password);

  @override
  List<Object> get props => [password];
}

class SignUpCountryChanged extends SignUpEvent {
  final String country;

  const SignUpCountryChanged(this.country);

  @override
  List<Object> get props => [country];
}

class SignUpSubmitted extends SignUpEvent {}
