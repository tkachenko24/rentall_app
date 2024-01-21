import 'package:flutter/material.dart';
import 'package:rental_app/common/export.dart';
import 'package:rental_app/dashboard/presentation/states/export.dart';

class AvailabilitySwitch extends StatelessWidget {
  final bool readOnly;
  const AvailabilitySwitch({
    required this.readOnly,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarsBloc, CarsState>(
      builder: (context, state) {
        return Switch(
          value: state.newCar.available,
          onChanged: !readOnly
              ? (value) =>
                  context.read<CarsBloc>().add(NewCarAvailabilityChanged(value))
              : null,
        );
      },
    );
  }
}
