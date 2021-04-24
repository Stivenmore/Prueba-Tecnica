import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Product extends Equatable {
  final String description;
  final String nameproduct;
  final int discout;
  final String urlimage;
  final int price;
  final int quantity;
  final String id;
  bool isChecked;

  Product({this.isChecked, 
      this.id,
      this.quantity,
      this.description,
      this.nameproduct,
      this.discout,
      this.urlimage,
      this.price});

  factory Product.fromsnapshot(Map<String, dynamic> snapshot) => Product(
      description: snapshot['Description'],
      nameproduct: snapshot['Nameproduct'],
      discout: snapshot['Discout'] as int,
      urlimage: snapshot['Urlimage'],
      price: snapshot['Price'] as int,
      id: snapshot['id'],
      isChecked: false,
      quantity: 0);

  @override
  List<Object> get props =>
      [description, nameproduct, discout, urlimage, price];
}
