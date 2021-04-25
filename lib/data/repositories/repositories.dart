import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pruebatecnica/data/repositories/services/services.dart';
import 'package:pruebatecnica/domain/entities/product.dart';
import 'package:pruebatecnica/domain/entities/shopping.dart';
import 'package:pruebatecnica/ui/Pages/Shopping/Shopping.dart';

class Repository implements Services {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Repository(this._firestore);

  Future<ServiceResult<List<Product>>> getDatafromFirebase() async {
    List<DocumentSnapshot> doc;
    var list;

    try {
      print('retorno valido');
      final resp = await _firestore.collection('Products').get();
      doc = resp.docs;
      list = doc.map((DocumentSnapshot documentSnapshot) {
        return (documentSnapshot.data());
      }).toList();
      if (resp.docs.isEmpty == false) {
        List<Product> product =
            (list as Iterable).map((e) => Product.fromsnapshot(e)).toList();
        return ServiceResult(data: product);
      } else {
        return ServiceResult(status: false, message: 'No tenemos data');
      }
    } catch (e) {
      return ServiceResult(status: false, message: e.toString());
    }
  }

  Future<ServiceResult<List<Product>>> setData({Product product}) async {
    try {
      print('metodo set');
      await _firestore.collection('Shopping').doc().set({
        'Nameproduct': product.nameproduct,
        'Discout': product.discout,
        'Urlimage': product.urlimage,
        'Price': product.price
      });
      return ServiceResult(message: 'Agregado con exito', status: true);
    } catch (e) {
      return ServiceResult(message: 'Intente mas tarde', status: false);
    }
  }

  Future<ServiceResult<List<Shopping>>> getdatashopping() async {
    List<DocumentSnapshot> doc;
    var list;
    try {
      final resp = await _firestore.collection('Shopping').get();
      doc = resp.docs;
      list = doc.map((DocumentSnapshot documentSnapshot) {
        return documentSnapshot.data();
      }).toList();
      if (resp.docs.isEmpty == false) {
        List<Shopping> shopping =
            (list as Iterable).map((e) => Shopping.fromsnapshot(e)).toList();
        return ServiceResult(data: shopping);
      } else {
        return ServiceResult(message: 'No tenemos data', status: true);
      }
    } catch (e) {
      return ServiceResult(message: e.toString(), status: false);
    }
  }

  @override
  void dispose() {}

  @override
  void init() {}
}
