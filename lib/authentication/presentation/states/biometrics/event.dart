part of 'bloc.dart';

abstract class BiometricsEvent extends Equatable {
  const BiometricsEvent();

  @override
  List<Object?> get props => [];
}

class BiometricsCalled extends BiometricsEvent {
  const BiometricsCalled();

  @override
  List<Object?> get props => [];
}
