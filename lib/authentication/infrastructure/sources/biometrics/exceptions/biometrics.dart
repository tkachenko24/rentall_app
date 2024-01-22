class BiometricsExceptions implements Exception {
  final String name;
  final String description;

  const BiometricsExceptions({
    required this.name,
    required this.description,
  });
}
