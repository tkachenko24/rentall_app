import 'package:flutter/material.dart';
import 'package:rental_app/authentication/presentation/export.dart';
import 'package:rental_app/common/export.dart';
import 'package:rental_app/dashboard/presentation/states/export.dart';

class PriceField extends StatelessWidget {
  const PriceField({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarsBloc, CarsState>(
      buildWhen: (previous, current) =>
          previous.newCar.price != current.newCar.price,
      builder: (context, state) {
        String? priceError = state.newCar.price.isEnabledValidator()
            ? state.newCar.price.check(
                Validate(
                  number: () => 'Only numbers',
                  other: () => 'Unknown error',
                ),
              )
            : null;
        return CustomField(
          error: priceError,
          textInputType: TextInputType.number,
          onChanged: (value) =>
              context.read<CarsBloc>().add(NewCarPriceChanged(value)),
          errorHint: 'Enter the price of the new car',
          label: 'Price',
        );
      },
    );
  }
}
