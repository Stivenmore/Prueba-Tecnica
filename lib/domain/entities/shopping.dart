
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
  class  Shopping extends Equatable{
  final String nameproduct;
  final int discout;
  final String urlimage;
  final int price;
   int canti;

  Shopping({
      this.nameproduct,
      this.discout,
      this.urlimage,
      this.price,
      this.canti})
      : super();

factory Shopping.fromsnapshot(Map<String, dynamic> snapshot) => Shopping(
      nameproduct: snapshot['Nameproduct'],
      discout: snapshot['Discout'] as int,
      urlimage: snapshot['Urlimage'],
      price: snapshot['Price'] as int,
      canti : snapshot['Canti'] );
  @override
  List<Object> get props =>
      [nameproduct, discout, urlimage, price, canti];
}
