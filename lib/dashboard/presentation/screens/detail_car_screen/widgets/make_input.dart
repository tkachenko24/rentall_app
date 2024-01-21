import 'package:flutter/material.dart';
import 'package:rental_app/authentication/presentation/export.dart';
import 'package:rental_app/common/export.dart';
import 'package:rental_app/dashboard/presentation/states/export.dart';

class MakeInput extends StatelessWidget {
  final int car;
  final bool readOnly;
  const MakeInput({
    required this.car,
    required this.readOnly,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarsBloc, CarsState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        String? makeError = state.newCar.make.isEnabledValidator()
            ? state.newCar.make.check(
                Validate(
                  empty: () => 'Not empty',
                  other: () => 'Unknown error',
                ),
              )
            : null;
        return !state.status.isSuccess() && state.cars.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : CustomField(
                error: makeError,
                readOnly: readOnly,
                initialValue: state.cars.isNotEmpty
                    ? state.cars[car].make.getOrElse('')
                    : 'Loading',
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
