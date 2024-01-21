import 'package:flutter/material.dart';
import 'package:rental_app/common/export.dart';
import 'package:rental_app/dashboard/presentation/states/export.dart';

class SaveCarButton extends StatelessWidget {
  const SaveCarButton({
    super.key,
    required this.theme,
    required this.onSuccessSave,
    required this.index,
  });
  final void Function() onSuccessSave;
  final int index;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarsBloc, CarsState>(
      builder: (context, state) {
        bool allValid = state.newCar.location.isValid() &&
            state.newCar.price.isValid() &&
            state.newCar.make.isValid() &&
            state.newCar.model.isValid();
        return IconButton(
          onPressed: allValid
              ? () {
                  context.read<CarsBloc>().add(EditCar(index));
                  onSuccessSave.call();
                }
              : null,
          icon: Icon(
            Icons.save_rounded,
            size: 50,
            color:
                allValid ? theme.scaffoldBackgroundColor : theme.disabledColor,
          ),
          color: theme.primaryColor,
        );
      },
    );
  }
}
