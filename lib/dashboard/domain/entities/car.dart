import 'package:foundation/domain/export.dart';
import 'package:rental_app/common/export.dart';
import 'package:rental_app/dashboard/export.dart';

class Car extends Entity {
  final FieldInput<InputString> make;
  final FieldInput<InputString> model;
  final FieldInput<InputNumbers> price;
  final FieldInput<InputString> location;
  final bool available;

  const Car({
    required this.make,
    required this.model,
    required this.price,
    required this.location,
    required this.available,
  });

  Car copyWith({
    FieldInput<InputString>? make,
    FieldInput<InputString>? model,
    FieldInput<InputNumbers>? price,
    FieldInput<InputString>? location,
    bool? available,
  }) {
    return Car(
      make: make ?? this.make,
      model: model ?? this.model,
      price: price ?? this.price,
      location: location ?? this.location,
      available: available ?? this.available,
    );
  }

  factory Car.empty() {
    return Car(
      make: FieldInput(InputString('')),
      model: FieldInput(InputString('')),
      price: FieldInput(InputNumbers('')),
      location: FieldInput(InputString('')),
      available: false,
    );
  }

  @override
  List<Object?> get props => [
        make,
        model,
        price,
        location,
        available,
      ];
}
