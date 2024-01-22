import 'package:rental_app/common/export.dart';
import 'package:foundation/export.dart' hide Input;
import 'package:rental_app/dashboard/export.dart';

part 'event.dart';
part 'state.dart';

class CarsBloc extends Bloc<CarsEvent, CarsState> {
  final FetchCarsUseCase fetch;
  final DeleteCarUseCase delete;
  final AddCarUseCase addCar;
  final EditCarUseCase editCar;

  CarsBloc({
    required this.fetch,
    required this.delete,
    required this.addCar,
    required this.editCar,
  }) : super(CarsState.empty()) {
    on<NewCarAvailabilityChanged>(_onAvailability);
    on<NewCarMakeChanged>(_onMake);
    on<NewCarPriceChanged>(_onPrice);
    on<NewCarLocationChanged>(_onLocation);
    on<NewCarModelChanged>(_onModel);
    on<FetchCars>(_onCarsFetch);
    on<EditCar>(_onEditCar);
    on<DeleteCar>(_onDeleteCar);
    on<AddCar>(_onAddCar);
  }

  void _onAvailability(
    NewCarAvailabilityChanged event,
    Emitter<CarsState> emit,
  ) async {
    emit(state.copyWith(newCar: state.newCar.copyWith(available: event.value)));
  }

  void _onMake(
    NewCarMakeChanged event,
    Emitter<CarsState> emit,
  ) async {
    emit(state.copyWith(
        newCar: state.newCar.copyWith(
            make: FieldInput(
      InputString(event.value),
      validate: true,
    ))));
  }

  void _onPrice(
    NewCarPriceChanged event,
    Emitter<CarsState> emit,
  ) async {
    emit(state.copyWith(
        newCar: state.newCar.copyWith(
            price: FieldInput(
      InputNumbers(event.value),
      validate: true,
    ))));
  }

  void _onLocation(
    NewCarLocationChanged event,
    Emitter<CarsState> emit,
  ) async {
    emit(state.copyWith(
        newCar: state.newCar.copyWith(
            location: FieldInput(
      InputString(event.value),
      validate: true,
    ))));
  }

  void _onModel(
    NewCarModelChanged event,
    Emitter<CarsState> emit,
  ) async {
    emit(state.copyWith(
        newCar: state.newCar.copyWith(
            model: FieldInput(
      InputString(event.value),
      validate: true,
    ))));
  }

  void _onCarsFetch(
    FetchCars event,
    Emitter<CarsState> emit,
  ) async {
    emit(state.copyWith(
      status: Status.loading(),
    ));
    final Try<DataBaseFailure, List<Car>> response = await fetch(Car.empty());
    response.fold(
        (failed) => emit(state.copyWith(status: Status.failed(failed))),
        (success) => emit(state.copyWith(
              status: Status.success(unit),
              cars: success,
            )));
    print(state.status);
  }

  void _onDeleteCar(
    DeleteCar event,
    Emitter<CarsState> emit,
  ) async {
    emit(state.copyWith(
      status: Status.loading(),
    ));
    final Try<DataBaseFailure, List<Car>> response = await delete(event.index);
    response.fold(
        (failed) => emit(state.copyWith(status: Status.failed(failed))),
        (success) => emit(state.copyWith(
              status: Status.success(unit),
              cars: success,
            )));
  }

  void _onEditCar(
    EditCar event,
    Emitter<CarsState> emit,
  ) async {
    emit(state.copyWith(
      status: Status.loading(),
    ));
    final Try<DataBaseFailure, List<Car>> response =
        await editCar([state.newCar, event.index]);
    response.fold(
        (failed) => emit(state.copyWith(status: Status.failed(failed))),
        (success) => emit(state.copyWith(
              status: Status.success(unit),
              cars: success,
            )));
  }

  void _onAddCar(
    AddCar event,
    Emitter<CarsState> emit,
  ) async {
    emit(state.copyWith(
      status: Status.loading(),
    ));
    final Try<DataBaseFailure, List<Car>> response = await addCar(state.newCar);
    response.fold(
        (failed) => emit(state.copyWith(status: Status.failed(failed))),
        (success) => emit(state.copyWith(
              status: Status.success(unit),
              cars: success,
            )));
  }
}
