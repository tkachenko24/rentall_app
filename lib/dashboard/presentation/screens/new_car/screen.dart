import 'package:flutter/material.dart';
import 'package:rental_app/common/presentation/export.dart';
import 'package:rental_app/dashboard/export.dart';
import 'package:rental_app/dashboard/presentation/screens/new_car/widgets/export.dart';

class NewCarScreen extends StatelessWidget {
  final void Function() toDashboard;
  final void Function() onSuccessSave;

  const NewCarScreen({
    super.key,
    required this.toDashboard,
    required this.onSuccessSave,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Add new car',
          style:
              Fonts.titleLarge.copyWith(color: theme.scaffoldBackgroundColor),
        ),
        toolbarHeight: 60,
        backgroundColor: theme.primaryColorLight,
        leading: Transform.flip(
          flipX: true,
          child: IconButton(
            onPressed: toDashboard,
            icon: const Icon(
              Icons.chevron_right_rounded,
            ),
            color: theme.scaffoldBackgroundColor,
          ),
        ),
        actions: [
          SaveCarButton(
            theme: theme,
            onSuccessSave: onSuccessSave,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: BlocBuilder<CarsBloc, CarsState>(
          builder: (context, state) {
            return Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(
                  flex: 7,
                ),
                const MakeInput(),
                const Spacer(),
                const ModelInput(),
                const Spacer(),
                const PriceField(),
                const Spacer(),
                const LocationInput(),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Availability',
                      style: Fonts.titleSmall,
                    ),
                    const AvailabilitySwitch(),
                  ],
                ),
                const Spacer(
                  flex: 7,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
