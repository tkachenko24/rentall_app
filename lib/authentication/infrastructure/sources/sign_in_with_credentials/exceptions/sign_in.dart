class SignInExceptions implements Exception {
  final String name;
  final String description;

  const SignInExceptions({
    required this.name,
    required this.description,
  });
}
