part of 'bloc.dart';

class CarsState extends Equatable {
  final Status<DataBaseFailure, Unit> status;
  final List<Car> cars;
  final Car newCar;
  final SortMethods sort;

  const CarsState({
    required this.status,
    required this.cars,
    required this.newCar,
    required this.sort,
  });

  factory CarsState.empty() => CarsState(
      status: Status.empty(),
      cars: const [],
      newCar: Car.empty(),
      sort: SortMethods.byNameAscending);

  CarsState copyWith({
    Status<DataBaseFailure, Unit>? status,
    List<Car>? cars,
    Car? newCar,
    SortMethods? sort,
  }) {
    return CarsState(
      status: status ?? this.status,
      cars: cars ?? this.cars,
      newCar: newCar ?? this.newCar,
      sort: sort ?? this.sort,
    );
  }

  @override
  List<Object?> get props => [
        status,
        cars,
        newCar,
        sort,
      ];
}
