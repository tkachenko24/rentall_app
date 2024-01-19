import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

abstract class Screens {
  List<RouteBase> get routes;
}

class Screen {
  String name;
  final String path;

  Screen({
    String? name,
    required this.path,
  }) : name = name ?? shortHash(UniqueKey());

  @override
  String toString() {
    return path;
  }
}
