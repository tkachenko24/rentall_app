import 'package:flutter/material.dart';
import 'package:rental_app/authentication/presentation/export.dart';
import 'package:rental_app/common/export.dart';
import 'package:rental_app/dashboard/presentation/states/export.dart';

class PriceInput extends StatelessWidget {
  final int car;
  final bool readOnly;
  const PriceInput({
    required this.car,
    required this.readOnly,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarsBloc, CarsState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        String? priceError = state.newCar.price.isEnabledValidator()
            ? state.newCar.price.check(
                Validate(
                  number: () => 'Not empty',
                  other: () => 'Unknown error',
                ),
              )
            : null;
        return !state.status.isSuccess() && state.cars.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : CustomField(
                error: priceError,
                readOnly: readOnly,
                initialValue: state.cars.isNotEmpty
                    ? state.cars[car].price.getOrElse('')
                    : 'Loading',
                textInputType: TextInputType.text,
                onChanged: (value) =>
                    context.read<CarsBloc>().add(NewCarPriceChanged(value)),
                errorHint: 'Enter the price of the new car',
                label: 'Price',
              );
      },
    );
  }
}
