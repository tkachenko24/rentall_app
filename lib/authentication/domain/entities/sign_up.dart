import 'package:foundation/domain/export.dart';

class SignUp extends Entity {
  final String password;
  final String username;

  const SignUp({
    required this.password,
    required this.username,
  });

  SignUp copyWith({
    String? username,
    String? password,
    String? country,
  }) {
    return SignUp(
      password: password ?? this.password,
      username: username ?? this.username,
    );
  }

  factory SignUp.empty() {
    return const SignUp(
      password: '',
      username: '',
    );
  }

  @override
  List<Object?> get props => [
        password,
        username,
      ];
}
