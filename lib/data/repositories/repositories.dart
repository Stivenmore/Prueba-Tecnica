import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pruebatecnica/data/repositories/services/services.dart';
import 'package:pruebatecnica/domain/entities/product.dart';
import 'package:pruebatecnica/domain/entities/shopping.dart';

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
      final resp = await _firestore
          .collection('Shopping')
          .where('Nameproduct', isEqualTo: product.nameproduct)
          .where('Urlimage', isEqualTo: product.urlimage)
          .where('Discout', isEqualTo: product.discout)
          .where('Price', isEqualTo: product.price)
          .get();

      if (resp.docs.length != 0 || resp.docs != null) {
        await _firestore
            .collection('Shopping')
            .doc(resp.docs[0].id)
            .set({'Canti': resp.docs[0]['Canti'] + 1}, SetOptions(merge: true));
      }

      return ServiceResult(message: 'Agregado con exito', status: true);
    } catch (e) {
      await _firestore.collection('Shopping').doc().set({
        'Nameproduct': product.nameproduct,
        'Discout': product.discout,
        'Urlimage': product.urlimage,
        'Price': product.price,
        'Canti': product.canti
      }, SetOptions(merge: true));
      return ServiceResult(message: 'Agregado con exito', status: false);
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

 Future<ServiceResult<List<Shopping>>> delete() async {
    try {
      final resp = await _firestore.collection('Shopping').get();
      final docs = resp.docs;
      for (var i = 0; i < resp.docs.length; i++) {
        _firestore.collection('Shopping').doc(docs[i].id).delete();
      }
     return ServiceResult(message: 'Vacio', status: true);
    } catch (e) {
      print(e.toString());
      return ServiceResult(message: 'Error', status: false);
    }
  }

  @override
  void dispose() {}

  @override
  void init() {}
}
