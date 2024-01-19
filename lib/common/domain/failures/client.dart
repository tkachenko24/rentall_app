import 'package:foundation/export.dart';

class ClientFailure extends Failure {
  final String name;
  final String description;

  const ClientFailure({
    required this.name,
    required this.description,
  });

  @override
  List<Object?> get props => [name, description];
}

class ClientOtherFailure extends ClientFailure {
  const ClientOtherFailure()
      : super(description: 'OTHER_ERROR', name: 'OTHER_ERROR');
}
