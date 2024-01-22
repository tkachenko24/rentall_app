import 'package:flutter/material.dart';
import 'package:rental_app/dashboard/export.dart';
import 'package:rental_app/dashboard/presentation/screens/dashboard/widgets/export.dart';

class CarsList extends StatelessWidget {
  final CarsState state;
  final void Function(int index) car;

  const CarsList({
    super.key,
    required this.theme,
    required this.state,
    required this.car,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: state.cars.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: InkWell(
              onTap: () => car(index),
              child: CarCard(
                theme: theme,
                state: state,
                index: index,
              ),
            ),
          );
        },
      ),
    );
  }
}
