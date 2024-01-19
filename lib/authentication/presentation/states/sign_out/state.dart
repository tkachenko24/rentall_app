part of 'bloc.dart';

class SignOutState extends Equatable {
  final Status<ClientFailure, Unit> status;

  const SignOutState({
    required this.status,
  });

  factory SignOutState.empty() => SignOutState(
        status: Status.empty(),
      );

  SignOutState copyWith({
    Status<ClientFailure, Unit>? status,
  }) {
    return SignOutState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [status];
}
