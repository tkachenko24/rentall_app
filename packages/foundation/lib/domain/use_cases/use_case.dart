import 'dart:async';
import 'package:meta/meta.dart';
import 'package:foundation/export.dart';

typedef Listener<Output> = Function(Output output);

abstract class Input extends Entity {}

class Empty extends Input {}

abstract class UseCase<Input, Output> {
  @protected
  Stream<Output> execute(Input input);

  @nonVirtual
  Stream<Output> invoke(Input input) {
    return execute(input);
  }

  Future<Output> call(Input input) {
    return invoke(input).first;
  }

  @protected
  String get logTag => runtimeType.toString();
}
