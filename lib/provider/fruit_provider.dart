import 'package:flutter/material.dart';
import 'package:store/models/fruit.dart';
import 'package:store/screens/fruits.dart';
import 'package:store/services/firestore_service.dart';
import 'package:uuid/uuid.dart';

class FruitProvider with ChangeNotifier {
  final firestoreService = FirestoreService();
  String _name;
  String _fruitId;
  double _price;
  String _des;
  var uuid = Uuid();

  //getter
  String get name => _name;
  double get price => _price;
  String get fruitId => _fruitId;
  String get des => _des;

  // setters
  changeName(String value) {
    _name = value;
    notifyListeners();
  }

  changePrice(String value) {
    _price = double.parse(value);
    notifyListeners();
  }

  changeDes(String value) {
    _des = value;
    notifyListeners();
  }

  loadValues(Fruit fruit) {
    print("Received ${fruit.fruitId}");
    _name = fruit.name;
    _price = fruit.price;
    _fruitId = fruit.fruitId;
    _des = fruit.des;
  }

  saveFruit() {
    var newFruit = Fruit(
        name: name,
        price: price,
        des: des,
        fruitId: fruitId == null ? uuid.v4() : fruitId);
    firestoreService.saveFruit(newFruit);
    print("New FruitId ${newFruit.fruitId}");
  }

  removeFruit(String fruitId) {
    firestoreService.removeFruit(fruitId);
  }
}
