import 'package:flutter/material.dart';
import 'package:rental_app/authentication/presentation/export.dart';
import 'package:rental_app/common/export.dart';
import 'package:rental_app/dashboard/presentation/states/export.dart';

class LocationInput extends StatelessWidget {
  const LocationInput({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarsBloc, CarsState>(
      buildWhen: (previous, current) =>
          previous.newCar.location != current.newCar.location,
      builder: (context, state) {
        String? locationError = state.newCar.location.isEnabledValidator()
            ? state.newCar.location.check(
                Validate(
                  empty: () => 'Not empty',
                  other: () => 'Unknown error',
                ),
              )
            : null;
        return CustomField(
          error: locationError,
          textInputType: TextInputType.text,
          onChanged: (value) =>
              context.read<CarsBloc>().add(NewCarLocationChanged(value)),
          errorHint: 'Enter the location of the new car',
          label: 'Location',
        );
      },
    );
  }
}
