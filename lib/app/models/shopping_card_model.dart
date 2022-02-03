import 'package:vakinha_burguer_mobile/app/models/product_model.dart';

class ShoppingCardModel {
  late int quantity;
  final ProductModel product;
  ShoppingCardModel({
    required this.quantity,
    required this.product,
  });
}
