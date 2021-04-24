import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pruebatecnica/data/repositories/services/services.dart';
import 'package:pruebatecnica/domain/entities/product.dart';

class Repository implements Services {
  FirebaseFirestore _firestore;

  Repository(this._firestore);

  Future<ServiceResult<List<Product>>> getDatafromFirebase() async {

    try {
      int index;
      print('retorno valido');
      final result = await _firestore.collection('Products').get();
      if (result.docs.length != 0) {
        List<Product> product = (result as Iterable)
            .map((e) => Product.fromsnapshot(result.docs, index))
            .toList();
        return ServiceResult(data: product);
      } 
      else {}
      return ServiceResult(status: false, message: 'No tenemos data');
    } catch (e) {
      return ServiceResult(status: false, message: e.toString());
    }
  }

  @override
  void dispose() {}

  @override
  void init() {}
}
