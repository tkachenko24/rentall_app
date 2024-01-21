import 'package:flutter/material.dart';
import 'package:rental_app/authentication/presentation/export.dart';
import 'package:rental_app/common/export.dart';
import 'package:rental_app/dashboard/presentation/states/export.dart';

class LocationInput extends StatelessWidget {
  final int car;
  final bool readOnly;
  const LocationInput({
    required this.car,
    required this.readOnly,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarsBloc, CarsState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        String? locationError = state.newCar.location.isEnabledValidator()
            ? state.newCar.location.check(
                Validate(
                  empty: () => 'Not empty',
                  other: () => 'Unknown error',
                ),
              )
            : null;
        return !state.status.isSuccess() && state.cars.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : CustomField(
                error: locationError,
                readOnly: readOnly,
                initialValue: state.cars.isNotEmpty
                    ? state.cars[car].location.getOrElse('')
                    : 'Loading',
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
