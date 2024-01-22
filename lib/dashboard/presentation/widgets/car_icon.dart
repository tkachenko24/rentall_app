import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

MaterialColor randomCarColor() {
  return Colors.primaries[Random().nextInt(Colors.primaries.length)];
}

IconData randomCarIcon() {
  List<IconData> availableIcons = [
    Icons.directions_car_outlined,
    Icons.directions_car_rounded,
    Icons.directions_car_sharp,
    Icons.rocket_launch,
    CupertinoIcons.car_detailed,
    CupertinoIcons.rocket,
    CupertinoIcons.rocket_fill,
  ];
  return availableIcons[Random().nextInt(availableIcons.length)];
}

class RandomCarIcon extends StatelessWidget {
  final double size;
  const RandomCarIcon({
    required this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      randomCarIcon(),
      size: size,
      color: randomCarColor(),
    );
  }
}
