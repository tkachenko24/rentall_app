part of 'bloc.dart';

abstract class CarsEvent extends Equatable {
  const CarsEvent();

  @override
  List<Object?> get props => [];
}

class FetchCars extends CarsEvent {
  const FetchCars();

  @override
  List<Object?> get props => [];
}

class DeleteCar extends CarsEvent {
  final int index;
  const DeleteCar(this.index);

  @override
  List<Object?> get props => [index];
}

class EditCar extends CarsEvent {
  final int index;
  const EditCar(this.index);

  @override
  List<Object?> get props => [index];
}

class AddCar extends CarsEvent {
  const AddCar();

  @override
  List<Object?> get props => [];
}

class SortCars extends CarsEvent {
  const SortCars();

  @override
  List<Object?> get props => [];
}

class NewCarAvailabilityChanged extends CarsEvent {
  final bool value;
  const NewCarAvailabilityChanged(this.value);

  @override
  List<Object?> get props => [value];
}

class NewCarMakeChanged extends CarsEvent {
  final String value;
  const NewCarMakeChanged(this.value);

  @override
  List<Object?> get props => [value];
}

class NewCarModelChanged extends CarsEvent {
  final String value;
  const NewCarModelChanged(this.value);

  @override
  List<Object?> get props => [value];
}

class NewCarPriceChanged extends CarsEvent {
  final String value;
  const NewCarPriceChanged(this.value);

  @override
  List<Object?> get props => [value];
}

class NewCarLocationChanged extends CarsEvent {
  final String value;
  const NewCarLocationChanged(this.value);

  @override
  List<Object?> get props => [value];
}
