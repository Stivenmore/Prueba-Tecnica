import 'package:flutter/cupertino.dart';
import 'package:pruebatecnica/domain/entities/product.dart';

class ProductCounter {
  int quantity;
  final Product shopping;

  ProductCounter({this.quantity = 1, @required this.shopping});
}
