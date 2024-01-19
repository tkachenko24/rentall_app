import 'package:flutter_bloc/flutter_bloc.dart';
import 'refresh_stream.dart';

class BlocNotifier extends RefreshStream {
  BlocNotifier(Bloc bloc) : super(bloc.stream);
}
