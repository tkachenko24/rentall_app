import 'package:foundation/export.dart';

class DataBaseFailure extends Failure {
  final String description;

  const DataBaseFailure({required this.description});
  @override
  List<Object?> get props => [description];
}
