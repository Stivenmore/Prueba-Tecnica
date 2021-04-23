import 'package:cloud_firestore/cloud_firestore.dart';

class Repository {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Repository(this._firestore);

  Future getData() async {
    try {
      print('retorno valido');
      return await _firestore.collection('Products').get();
    } catch (e) {
      print('retorno no valido');
      return null;
    }
  }
}
