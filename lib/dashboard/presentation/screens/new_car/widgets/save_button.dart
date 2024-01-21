import 'package:flutter/material.dart';
import 'package:rental_app/common/export.dart';
import 'package:rental_app/dashboard/presentation/states/export.dart';

class SaveCarButton extends StatelessWidget {
  const SaveCarButton({
    super.key,
    required this.theme,
    required this.onSuccessSave,
  });
  final void Function() onSuccessSave;

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CarsBloc, CarsState>(
      listener: (context, state) =>
          state.status.isSuccess() ? onSuccessSave.call() : null,
      builder: (context, state) {
        bool allValid = state.newCar.location.isValid() &&
            state.newCar.price.isValid() &&
            state.newCar.make.isValid() &&
            state.newCar.model.isValid();
        return IconButton(
          onPressed: allValid
              ? () => context.read<CarsBloc>().add(const AddCar())
              : null,
          icon: Icon(
            Icons.save_rounded,
            color:
                allValid ? theme.scaffoldBackgroundColor : theme.disabledColor,
          ),
          color: theme.primaryColor,
        );
      },
    );
  }
}
