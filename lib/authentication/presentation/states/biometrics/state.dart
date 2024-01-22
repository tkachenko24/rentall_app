part of 'bloc.dart';

class BiometricsState extends Equatable {
  final Status<ClientFailure, Unit> status;

  const BiometricsState({
    required this.status,
  });

  factory BiometricsState.empty() => BiometricsState(
        status: Status.empty(),
      );

  BiometricsState copyWith({
    Status<ClientFailure, Unit>? status,
  }) {
    return BiometricsState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        status,
      ];
}
