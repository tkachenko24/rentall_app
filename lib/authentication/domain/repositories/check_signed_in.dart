import 'dart:async';
import 'package:rental_app/authentication/export.dart';

abstract class CheckSignedInRepository {
  Stream<Authentication> get status;
}
