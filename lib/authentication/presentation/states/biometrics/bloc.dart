import 'package:rental_app/authentication/export.dart';
import 'package:rental_app/common/export.dart';
import 'package:foundation/export.dart';

part 'event.dart';
part 'state.dart';

class BiometricsBloc extends Bloc<BiometricsEvent, BiometricsState> {
  final BiometricsUseCase check;

  BiometricsBloc({
    required this.check,
  }) : super(BiometricsState.empty()) {
    on<BiometricsCalled>(_onBiometricsCalled);
  }

  void _onBiometricsCalled(
    BiometricsCalled event,
    Emitter<BiometricsState> emit,
  ) {
    emit(state.copyWith(
      status: Status.empty(),
    ));
  }
}
