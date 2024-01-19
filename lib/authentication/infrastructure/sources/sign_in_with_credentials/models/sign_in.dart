class SignInModel {
  final String token;

  const SignInModel({
    required this.token,
  });

  factory SignInModel.empty() {
    return const SignInModel(
      token: '',
    );
  }
}
