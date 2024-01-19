import 'package:foundation/export.dart';

final RegExp _versionRegex =
    RegExp(r"^([\d.]+)(-([0-9A-Za-z\-.]+))?(\+([0-9A-Za-z\-.]+))?$");

class Version extends Entity {
  final int major;
  final int minor;
  final int patch;
  final String build;
  final List<String> labels;

  const Version({
    required this.major,
    required this.minor,
    required this.patch,
    required this.build,
    required this.labels,
  });

  @override
  List<Object?> get props => [major, minor, patch, build];

  @override
  String toString() {
    final StringBuffer output = StringBuffer("$major.$minor.$patch");
    if (labels.isNotEmpty) {
      output.write("-${labels.join('.')}");
    }
    if (build.trim().isNotEmpty) {
      output.write("+${build.trim()}");
    }

    return output.toString();
  }

  factory Version.empty() {
    return const Version(
      major: 0,
      minor: 0,
      patch: 0,
      build: '0',
      labels: [],
    );
  }

  static Version parse(String versionString) {
    if (versionString.trim().isEmpty) {
      throw const FormatException("Cannot parse empty string into version");
    }

    if (!_versionRegex.hasMatch(versionString)) {
      throw const FormatException("Not a properly formatted version string");
    }

    final Match m = _versionRegex.firstMatch(versionString)!;
    final String version = m.group(1)!;

    int? major, minor, patch;
    final List<String> parts = version.split(".");
    major = int.parse(parts[0]);
    if (parts.length > 1) {
      minor = int.parse(parts[1]);
      if (parts.length > 2) {
        patch = int.parse(parts[2]);
      }
    }

    final String preReleaseString = m.group(3) ?? "";
    List<String> labels = <String>[];
    if (preReleaseString.trim().isNotEmpty) {
      labels = preReleaseString.split(".");
    }
    final String build = m.group(5) ?? "";

    return Version(
      major: major,
      minor: minor ?? 0,
      patch: patch ?? 0,
      build: build,
      labels: labels,
    );
  }
}
