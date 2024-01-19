part of 'bloc.dart';

abstract class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object?> get props => [];
}

class SignInEmailChanged extends SignInEvent {
  final String email;

  const SignInEmailChanged(this.email);

  @override
  List<Object?> get props => [email];
}

class SignInPasswordChanged extends SignInEvent {
  final String password;

  const SignInPasswordChanged(this.password);

  @override
  List<Object> get props => [password];
}

class SignInCaptchaChanged extends SignInEvent {
  final String captcha;

  const SignInCaptchaChanged(this.captcha);

  @override
  List<Object> get props => [captcha];
}

class SignInSubmitted extends SignInEvent {}
