import 'package:foundation/export.dart';

class Token extends Entity {
  final String token;

  const Token({
    required this.token,
  });

  @override
  List<Object?> get props => [
        token,
      ];
}
