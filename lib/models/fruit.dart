class Fruit {
  final String fruitId;
  final String name;
  final double price;
  final String des;

  Fruit({
    this.fruitId,
    this.name,
    this.price,
    this.des,
  });

  Map<String, dynamic> toMap() {
    return {
      'fruitId': fruitId,
      'name': name,
      'price': price,
      'des': des,
    };
  }

  Fruit.fromFirestore(Map<String, dynamic> firestore)
      : fruitId = firestore['fruitId'],
        name = firestore['name'],
        price = firestore['price'],
        des = firestore['des'];
}
