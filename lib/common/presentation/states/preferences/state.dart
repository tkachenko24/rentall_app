part of 'bloc.dart';

class PreferencesState extends Equatable {
  final Status<Unit, Unit> status;

  const PreferencesState({
    required this.status,
  });

  factory PreferencesState.empty() {
    return PreferencesState(
      status: Status.empty(),
    );
  }

  PreferencesState copyWith({
    Status<Unit, Unit>? status,
  }) {
    return PreferencesState(
      status: status ?? this.status,
    );
  }

  bool isEmpty() {
    return status.isEmpty();
  }

  bool isLoading() {
    return status.isLoading();
  }

  bool isFailed() {
    return status.isFailed();
  }

  bool isSuccess() {
    return status.isSuccess();
  }

  bool isFinish() {
    return status.isFinish();
  }

  @override
  List<Object?> get props => [status];
}
