class CarModel {
  final String make;
  final String model;
  final String price;
  final String location;
  final bool available;

  const CarModel({
    required this.make,
    required this.model,
    required this.price,
    required this.available,
    required this.location,
  });

  factory CarModel.empty() {
    return const CarModel(
      make: '',
      model: '',
      price: '',
      location: '',
      available: false,
    );
  }
}
