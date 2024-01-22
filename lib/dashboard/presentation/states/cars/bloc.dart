import 'package:rental_app/common/export.dart';
import 'package:foundation/export.dart' hide Input;
import 'package:rental_app/dashboard/export.dart';
import 'package:rental_app/dashboard/presentation/screens/detail_car_screen/export.dart';

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
    on<SortCars>(_onSortCars);
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
    print(response);
    response.fold(
        (failed) => emit(state.copyWith(status: Status.failed(failed))),
        (success) => emit(state.copyWith(
              status: Status.success(unit),
              cars: success,
            )));
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

  void _onSortCars(
    SortCars event,
    Emitter<CarsState> emit,
  ) async {
    SortMethods nextSortMethod() {
      switch (state.sort) {
        case SortMethods.byNameAscending:
          return SortMethods.byNameDescending;
        case SortMethods.byNameDescending:
          return SortMethods.byPriceAscending;
        case SortMethods.byPriceAscending:
          return SortMethods.byPriceDescending;
        case SortMethods.byPriceDescending:
          return SortMethods.byNameAscending;
      }
    }

    emit(state.copyWith(
      sort: nextSortMethod(),
      status: Status.loading(),
    ));

    List<Car> sortedCars = List<Car>.from(state.cars);
    sortedCars.sort((a, b) {
      switch (state.sort) {
        case SortMethods.byNameAscending:
          return a.make.getOrElse('').compareTo(b.make.getOrElse(''));
        case SortMethods.byNameDescending:
          return b.make.getOrElse('').compareTo(a.make.getOrElse(''));
        case SortMethods.byPriceAscending:
          return num.tryParse(a.price.getOrElse(''))!
              .compareTo(num.tryParse(b.price.getOrElse('')) ?? 0);
        case SortMethods.byPriceDescending:
          return num.tryParse(b.price.getOrElse(''))!
              .compareTo(num.tryParse(a.price.getOrElse('')) ?? 0);
        default:
          return 0;
      }
    });

    emit(state.copyWith(
      status: Status.success(unit),
      cars: sortedCars,
    ));
  }
}
