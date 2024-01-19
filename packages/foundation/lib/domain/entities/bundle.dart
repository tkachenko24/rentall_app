import 'package:foundation/export.dart';

class Bundle extends Entity {
  final String name;
  final String id;
  final Version version;

  const Bundle({
    required this.name,
    required this.id,
    required this.version,
  });

  factory Bundle.empty() {
    return Bundle(
      name: '',
      id: '',
      version: Version.empty(),
    );
  }

  @override
  List<Object?> get props => [id, name];
}
