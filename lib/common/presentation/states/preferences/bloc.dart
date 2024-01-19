import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foundation/export.dart';

part 'event.dart';
part 'state.dart';

class PreferencesBloc extends Bloc<PreferencesEvent, PreferencesState> {
  final Future<void> Function(PreferencesState state) setup;

  PreferencesBloc(this.setup) : super(PreferencesState.empty()) {
    on<Initialization>(_onInitialization);
  }

  void _onInitialization(
    Initialization event,
    Emitter<PreferencesState> emit,
  ) async {
    emit(
      state.copyWith(
        status: Status.loading(),
      ),
    );
    try {
      await setup(state);
      emit(
        state.copyWith(
          status: Status.success(unit),
        ),
      );
    } catch (err) {
      emit(
        state.copyWith(
          status: Status.failed(unit),
        ),
      );
    }
  }
}
