import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fruitstore/fruits.dart';

class FirebaseApi {
  static Future<String> createFruit(Fruit fruit) async {
    final docFruit = FirebaseFirestore.instance.collection('fruits').doc();

    fruit.id = docFruit.id;
    await docFruit.set(fruit.toJson());
    return docFruit.id;
  }
}
