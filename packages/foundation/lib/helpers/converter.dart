import 'package:meta/meta.dart';

@experimental
abstract class Converter<T, S> {
  T decode(S value);

  S encode(T value);
}
