import 'package:plantsatu/data/data.dart';

class CartData {
  ProductModel model;
  int count;

  CartData({required this.model, required this.count});
}

List<CartData> cartData = [];
