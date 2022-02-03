import 'dart:convert';

class ProductModel {
  final int id;
  final String name;
  final double price;
  final String image;
  final String description;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'image': image,
      'description': description,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      image: map['image'] ?? '',
      description: map['description'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));
}
