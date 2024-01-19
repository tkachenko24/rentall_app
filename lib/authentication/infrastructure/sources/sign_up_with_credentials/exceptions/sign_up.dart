class SignUpExceptions implements Exception {
  final String name;
  final String description;

  const SignUpExceptions({
    required this.name,
    required this.description,
  });
}
