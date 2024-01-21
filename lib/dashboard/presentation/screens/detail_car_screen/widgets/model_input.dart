import 'package:flutter/material.dart';
import 'package:rental_app/authentication/presentation/export.dart';
import 'package:rental_app/common/export.dart';
import 'package:rental_app/dashboard/presentation/states/export.dart';

class ModelInput extends StatelessWidget {
  final int car;
  final bool readOnly;
  const ModelInput({
    required this.car,
    required this.readOnly,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarsBloc, CarsState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        String? modelError = state.newCar.model.isEnabledValidator()
            ? state.newCar.model.check(
                Validate(
                  empty: () => 'Not empty',
                  other: () => 'Unknown error',
                ),
              )
            : null;
        return !state.status.isSuccess() && state.cars.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : CustomField(
                error: modelError,
                readOnly: readOnly,
                initialValue: state.cars.isNotEmpty
                    ? state.cars[car].model.getOrElse('')
                    : 'Loading',
                textInputType: TextInputType.text,
                onChanged: (value) =>
                    context.read<CarsBloc>().add(NewCarModelChanged(value)),
                errorHint: 'Enter the model of the new car',
                label: 'Model',
              );
      },
    );
  }
}
