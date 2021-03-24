import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  final String id;
  Database({this.id});

  final CollectionReference collectionReference =
      Firestore.instance.collection("fruits");

  Future updateData(String name, String img, String price, String desc) async {
    return await collectionReference
        .document(id)
        .setData({"name": name, "image": img, "price": price, "decs": desc});
  }
}
