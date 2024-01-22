import 'package:flutter/material.dart';
import 'package:rental_app/common/presentation/export.dart';
import 'package:rental_app/dashboard/export.dart';
import 'package:rental_app/dashboard/presentation/screens/detail_car_screen/export.dart';

import 'widgets/export.dart';

class DashboardScreen extends StatelessWidget {
  final void Function() signOut;
  final void Function() addCar;
  final void Function(int) car;

  final ThemeData theme;
  const DashboardScreen({
    super.key,
    required this.signOut,
    required this.addCar,
    required this.theme,
    required this.car,
  });

  @override
  Widget build(BuildContext context) {
    context.read<CarsBloc>().add(const FetchCars());
    return Scaffold(
      floatingActionButton: IconButton(
        onPressed: () => addCar.call(),
        icon: const Icon(Icons.add_circle_rounded),
        color: theme.primaryColor,
        iconSize: 50,
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Our Cars',
          style:
              Fonts.titleLarge.copyWith(color: theme.scaffoldBackgroundColor),
        ),
        toolbarHeight: 60,
        backgroundColor: theme.primaryColorLight,
        leading: Transform.flip(
          flipX: true,
          child: IconButton(
            onPressed: signOut,
            icon: const Icon(
              Icons.logout_rounded,
            ),
            color: theme.scaffoldBackgroundColor,
          ),
        ),
        actions: [
          BlocBuilder<CarsBloc, CarsState>(
            builder: (context, state) {
              return IconButton(
                  onPressed: () {
                    context.read<CarsBloc>().add(const SortCars());
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(sortMessage(state.sort)),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.sort_rounded,
                    color: theme.scaffoldBackgroundColor,
                  ));
            },
          )
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        child: BlocBuilder<CarsBloc, CarsState>(
          buildWhen: (previous, current) => previous.status != current.status,
          builder: (context, state) {
            return state.status.isLoading()
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : state.cars.isNotEmpty
                    ? CarsList(
                        theme: theme,
                        state: state,
                        car: car,
                      )
                    : Column(
                        children: [
                          const Spacer(),
                          Center(
                            child: Text(
                              'No cars available, try add a new one :-)!',
                              style: Fonts.titleLarge,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const Spacer(),
                          Transform.flip(
                              flipY: true,
                              child: const Icon(
                                Icons.arrow_outward_rounded,
                                size: 50,
                              )),
                          const Spacer(),
                        ],
                      );
          },
        ),
      ),
    );
  }
}
