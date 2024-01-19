class TokenModel {
  final String token;

  const TokenModel({
    required this.token,
  });

  factory TokenModel.empty() {
    return const TokenModel(
      token: '',
    );
  }
}
