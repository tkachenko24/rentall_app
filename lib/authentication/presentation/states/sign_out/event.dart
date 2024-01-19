part of 'bloc.dart';

abstract class SignOutEvent extends Equatable {
  const SignOutEvent();

  @override
  List<Object?> get props => [];
}

class SignOutSubmitted extends SignOutEvent {}
