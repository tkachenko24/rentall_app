import 'package:flutter/material.dart';
import 'package:rental_app/common/presentation/export.dart';
import 'package:rental_app/dashboard/export.dart';
import 'package:rental_app/dashboard/presentation/screens/dashboard/widgets/export.dart';

class CarCard extends StatelessWidget {
  const CarCard({
    super.key,
    required this.theme,
    required this.state,
    required this.index,
  });

  final ThemeData theme;
  final CarsState state;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      color: theme.cardColor,
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CardSpan(
                  title: 'Brand: ',
                  value: state.cars[index].make.getOrElse(''),
                ),
                const SizedBox(height: 15),
                CardSpan(
                  title: 'Model: ',
                  value: state.cars[index].model.getOrElse(''),
                ),
                const SizedBox(height: 15),
                CardSpan(
                  title: 'Price: ',
                  value: state.cars[index].price.getOrElse(''),
                ),
                const SizedBox(height: 15),
                CardSpan(
                  title: 'Location: ',
                  value: state.cars[index].location.getOrElse(''),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Available: ",
                      style: Fonts.bodyLarge,
                    ),
                    Icon(
                      state.cars[index].available
                          ? Icons.event_available_rounded
                          : Icons.event_busy_rounded,
                      color: state.cars[index].available
                          ? Colors.green
                          : Colors.red,
                      size: 40,
                    )
                  ],
                ),
              ],
            ),
            const RandomCarIcon(
              size: 150,
            ),
          ],
        ),
      ),
    );
  }
}
