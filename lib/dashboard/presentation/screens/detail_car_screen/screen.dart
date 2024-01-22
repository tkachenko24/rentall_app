import 'package:flutter/material.dart';
import 'package:rental_app/common/presentation/export.dart';
import 'package:rental_app/dashboard/export.dart';

import 'package:rental_app/dashboard/presentation/screens/detail_car_screen/widgets/export.dart';

class DetailCarScreen extends StatefulWidget {
  final int car;
  final ThemeData theme;
  final void Function() back;
  const DetailCarScreen({
    super.key,
    required this.car,
    required this.theme,
    required this.back,
  });

  @override
  State<DetailCarScreen> createState() => _DetailCarScreenState();
}

bool readOnly = false;

class _DetailCarScreenState extends State<DetailCarScreen> {
  @override
  Widget build(BuildContext context) {
    context.read<CarsBloc>().add(const FetchCars());
    return Scaffold(
      floatingActionButton: IconButton(
        onPressed: () {
          setState(() {
            readOnly = !readOnly;
          });
        },
        icon: Icon(readOnly ? Icons.edit : Icons.edit_off_rounded),
        color: widget.theme.primaryColor,
        iconSize: 50,
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'More about this Car',
          style: Fonts.titleLarge
              .copyWith(color: widget.theme.scaffoldBackgroundColor),
        ),
        toolbarHeight: 60,
        backgroundColor: widget.theme.primaryColorLight,
        leading: Transform.flip(
          flipX: true,
          child: IconButton(
            onPressed: widget.back,
            icon: const Icon(
              Icons.chevron_right_rounded,
            ),
            color: widget.theme.scaffoldBackgroundColor,
          ),
        ),
        actions: [
          BlocBuilder<CarsBloc, CarsState>(
            builder: (context, state) {
              return IconButton(
                onPressed: () => {
                  context.read<CarsBloc>().add(DeleteCar(widget.car)),
                  state.status.isSuccess() ? widget.back : null,
                },
                icon: Icon(
                  Icons.delete_forever_rounded,
                  color: widget.theme.scaffoldBackgroundColor,
                ),
              );
            },
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.6,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: readOnly
                    ? widget.theme.focusColor
                    : widget.theme.primaryColorLight),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Spacer(
                    flex: 2,
                  ),
                  SaveCarButton(
                      theme: widget.theme,
                      onSuccessSave: () {
                        widget.back.call();
                      },
                      index: widget.car),
                  const Spacer(),
                  MakeInput(car: widget.car, readOnly: readOnly),
                  const Spacer(),
                  ModelInput(car: widget.car, readOnly: readOnly),
                  const Spacer(),
                  PriceInput(car: widget.car, readOnly: readOnly),
                  const Spacer(),
                  LocationInput(car: widget.car, readOnly: readOnly),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Availability',
                        style: Fonts.titleMedium,
                      ),
                      AvailabilitySwitch(
                        readOnly: readOnly,
                      ),
                    ],
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
