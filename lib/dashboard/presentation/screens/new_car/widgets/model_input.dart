import 'package:flutter/material.dart';
import 'package:rental_app/authentication/presentation/export.dart';
import 'package:rental_app/common/export.dart';
import 'package:rental_app/dashboard/presentation/states/export.dart';

class ModelInput extends StatelessWidget {
  const ModelInput({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarsBloc, CarsState>(
      buildWhen: (previous, current) =>
          previous.newCar.model != current.newCar.model,
      builder: (context, state) {
        String? modelError = state.newCar.model.isEnabledValidator()
            ? state.newCar.model.check(
                Validate(
                  empty: () => 'Not empty',
                  other: () => 'Unknown error',
                ),
              )
            : null;
        return CustomField(
          error: modelError,
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
