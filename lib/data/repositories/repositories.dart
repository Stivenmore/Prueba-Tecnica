import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pruebatecnica/data/repositories/services/services.dart';
import 'package:pruebatecnica/domain/entities/product.dart';

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

  @override
  void dispose() {}

  @override
  void init() {}
}
