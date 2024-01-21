import 'package:rental_app/common/helpers/export.dart';
import 'package:rental_app/dashboard/export.dart';
import 'package:rental_app/dashboard/infrastructure/sources/cars_database/export.dart';
import 'dart:convert';

class CarConverter {
  CarModel toModel(Car input) {
    return CarModel(
      make: input.make.getOrElse(''),
      model: input.model.getOrElse(''),
      price: input.price.getOrElse(''),
      available: input.available,
      location: input.location.getOrElse(''),
    );
  }

  CarModel fromMapString(String source) {
    Map<String, dynamic> map = jsonDecode(source);
    return CarModel(
      make: map['make'],
      model: map['model'],
      price: map['price'],
      available: map['available'],
      location: map['location'],
    );
  }

  String toMapString(CarModel source) {
    Map<String, dynamic> map = {
      'make': source.make,
      'model': source.model,
      'price': source.price,
      'available': source.available,
      'location': source.location,
    };
    return jsonEncode(map);
  }

  Car toEntity(CarModel output) {
    return Car(
      make: FieldInput(InputString(output.make)),
      model: FieldInput(InputString(output.model)),
      price: FieldInput(InputNumbers(output.price)),
      location: FieldInput(InputString(output.location)),
      available: output.available,
    );
  }
}
