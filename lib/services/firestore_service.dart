import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:store/models/fruit.dart';

class FirestoreService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveFruit(Fruit fruit) {
    return _db.collection('fruits').doc(fruit.fruitId).set(fruit.toMap());
  }

  Stream<List<Fruit>> getFruits() {
    return _db.collection('fruits').snapshots().map((snapshot) => snapshot.docs
        .map((document) => Fruit.fromFirestore(document.data()))
        .toList());
  }

  Future<void> removeFruit(String fruitId) {
    return _db.collection('fruits').doc(fruitId).delete();
  }
}
