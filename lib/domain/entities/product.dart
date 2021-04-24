import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String description;
  final String nameproduct;
  final String discout;
  final String urlimage;
  final int price;

  Product(
      {this.description,
      this.nameproduct,
      this.discout,
      this.urlimage,
      this.price});

  factory Product.fromsnapshot(
      List<QueryDocumentSnapshot> snapshot, int index) {
    return Product(
        description: snapshot[index]['Description'],
        nameproduct: snapshot[index]['Nameproduct'],
        discout: snapshot[index]['Discout'],
        urlimage: snapshot[index]['Urlimage'],
        price: snapshot[index]['price']);
  }

  @override
  List<Object> get props =>
      [description, nameproduct, discout, urlimage, price];
}

class Document extends Equatable {
  final String id;

  Document({this.id});

  factory Document.map(Map<String, dynamic> map) => Document(id: map['id']);

  @override
  List<Object> get props => [id];
}
