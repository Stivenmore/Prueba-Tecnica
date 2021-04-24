import 'package:pruebatecnica/domain/entities/product.dart';

// ignore: must_be_immutable
class ShoppingCard extends Product {
  final String description;
  final String nameproduct;
  final int discout;
  final String urlimage;
  final int price;
  final int canti;

  ShoppingCard(Product product,{
      this.description,
      this.nameproduct,
      this.discout,
      this.urlimage,
      this.price,
      this.canti})
      : super(
            description: product.description,
            nameproduct: product.nameproduct,
            discout: product.discout,
            urlimage: product.urlimage,
            price: product.price,
            isChecked: product.isChecked);

  @override
  List<Object> get props =>
      [description, nameproduct, discout, urlimage, price, canti];
}
