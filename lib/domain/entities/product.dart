import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String description;
  final String nameproduct;
  final int discout;
  final String urlimage;
  final int price;

  Product(
      {this.description,
      this.nameproduct,
      this.discout,
      this.urlimage,
      this.price});

  factory Product.fromsnapshot(
      Map<String, dynamic> snapshot) 
    => Product(
        description: snapshot['Description'],
        nameproduct: snapshot['Nameproduct'],
        discout: snapshot['Discout'] as int,
        urlimage: snapshot['Urlimage'],
        price: snapshot['Price'] as int
        );
  

  @override
  List<Object> get props =>
      [description, nameproduct, discout, urlimage, price];
}