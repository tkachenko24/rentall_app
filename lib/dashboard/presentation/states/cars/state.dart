part of 'bloc.dart';

class CarsState extends Equatable {
  final Status<DataBaseFailure, Unit> status;
  final List<Car> cars;
  final Car newCar;

  const CarsState({
    required this.status,
    required this.cars,
    required this.newCar,
  });

  factory CarsState.empty() => CarsState(
        status: Status.empty(),
        cars: const [],
        newCar: Car.empty(),
      );

  CarsState copyWith({
    Status<DataBaseFailure, Unit>? status,
    List<Car>? cars,
    Car? newCar,
  }) {
    return CarsState(
      status: status ?? this.status,
      cars: cars ?? this.cars,
      newCar: newCar ?? this.newCar,
    );
  }

  @override
  List<Object?> get props => [
        status,
        cars,
        newCar,
      ];
}
