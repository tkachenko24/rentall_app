import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rental_app/common/presentation/export.dart';
import 'package:rental_app/dashboard/export.dart';

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
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                color: theme.cardColor,
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(
                        CupertinoIcons.car_detailed,
                        size: 100,
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "Brand: ${state.cars[index].make.getOrElse('')}",
                        style: Fonts.titleMedium,
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "Model: ${state.cars[index].model.getOrElse('')}",
                        style: Fonts.titleMedium,
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "Price: ${state.cars[index].price.getOrElse('')}",
                        style: Fonts.titleMedium,
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "Location: ${state.cars[index].location.getOrElse('')}",
                        style: Fonts.titleMedium,
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Available: ",
                            style: Fonts.titleMedium,
                          ),
                          Icon(state.cars[index].available
                              ? Icons.event_available_rounded
                              : Icons.event_busy_rounded)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
