import 'package:foundation/domain/export.dart';

class SignIn extends Entity {
  final String password;
  final String username;

  const SignIn({
    required this.password,
    required this.username,
  });

  SignIn copyWith({
    String? username,
    String? password,
    String? captcha,
  }) {
    return SignIn(
      password: password ?? this.password,
      username: username ?? this.username,
    );
  }

  factory SignIn.empty() {
    return const SignIn(
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
