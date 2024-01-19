part of 'bloc.dart';

abstract class PreferencesEvent extends Equatable {
  const PreferencesEvent();

  @override
  List<Object?> get props => [];
}

class Initialization extends PreferencesEvent {
  const Initialization();

  @override
  List<Object?> get props => [];
}
