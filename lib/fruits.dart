import 'package:flutter/cupertino.dart';

class FruitProvider extends ChangeNotifier {
  List<Fruit> _fruits = [
    Fruit(name: "Banana", url: null, price: "50", desc: "Tasty"),
    Fruit(name: "Apple", url: null, price: "200", desc: "Healthy")
  ];

  List<Fruit> get fruit => _fruits.toList();
}

class Fruit {
  String id;
  String name;
  String url;
  String price;
  String desc;

  Fruit({
    this.id,
    this.name,
    this.desc,
    this.price,
    this.url,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        "id": id,
        "url": url,
        "price": price,
        "desc": desc,
      };

  static Fruit fromJson(Map<String, dynamic> json) => Fruit(
        name: json['name'],
        id: json['id'],
        url: json['url'],
        price: json['price'],
        desc: json['desc'],
      );
}
