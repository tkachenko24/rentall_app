import 'package:flutter/material.dart';
import 'package:rental_app/authentication/presentation/export.dart';
import 'package:rental_app/common/export.dart';
import 'package:rental_app/dashboard/presentation/states/export.dart';

class MakeInput extends StatelessWidget {
  const MakeInput({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarsBloc, CarsState>(
      buildWhen: (previous, current) =>
          previous.newCar.make != current.newCar.make,
      builder: (context, state) {
        String? makeError = state.newCar.make.isEnabledValidator()
            ? state.newCar.make.check(
                Validate(
                  empty: () => 'Not empty',
                  other: () => 'Unknown error',
                ),
              )
            : null;
        return CustomField(
          error: makeError,
          textInputType: TextInputType.text,
          onChanged: (value) =>
              context.read<CarsBloc>().add(NewCarMakeChanged(value)),
          errorHint: 'Enter the manufacturer of the new car',
          label: 'Make',
        );
      },
    );
  }
}
