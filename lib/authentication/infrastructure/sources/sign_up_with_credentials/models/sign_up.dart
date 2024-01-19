class SignUpModel {
  final String token;

  const SignUpModel({
    required this.token,
  });

  factory SignUpModel.empty() {
    return const SignUpModel(
      token: '',
    );
  }
}
