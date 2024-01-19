part of 'bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AuthenticationChanged extends AuthenticationEvent {
  final Authentication status;

  const AuthenticationChanged(this.status);

  @override
  List<Object> get props => [status];
}
