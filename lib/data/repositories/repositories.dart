import 'package:cloud_firestore/cloud_firestore.dart';

class Repository {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Repository(this._firestore);
  
  Future getData() async {
    try {
      final data = await _firestore.collection('Products').get();
      return data;
    } catch (e) {
      return null;
    }
  }
}
