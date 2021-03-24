import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:fruitstore/fruits.dart';
import 'package:provider/provider.dart';

class FruitListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FruitWidget(
        fruit: Fruit(name: "Apple", url: "#", price: "200", desc: "Healthy"));
  }
}

class FruitWidget extends StatelessWidget {
  final Fruit fruit;
  const FruitWidget({
    @required this.fruit,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FruitProvider>(context);
    final fruits = provider.fruit;
    return fruits.isEmpty
        ? Center(
            child: Text(
              "NO Fruits !!",
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0),
            ),
          )
        : ListView.separated(
            physics: BouncingScrollPhysics(),
            separatorBuilder: (context, index) => Container(
                  height: 8,
                ),
            padding: EdgeInsets.all(16),
            itemBuilder: (context, index) {
              final eachfruit = fruits[index];
              return FruitWidget(fruit: eachfruit);
            },
            itemCount: fruits.length);
    // return Padding(
    //   padding: const EdgeInsets.all(8.0),
    //   child: Card(
    //     child: Padding(
    //       padding: const EdgeInsets.fromLTRB(15, 8, 15, 15),
    //       child: Row(
    //         children: [
    //           CircleAvatar(
    //             radius: 15,
    //           ),
    //           SizedBox(width: 20.0),
    //           Padding(
    //             padding: const EdgeInsets.all(8.0),
    //             child: Column(
    //               children: [
    //                 Text(fruit.name),
    //                 SizedBox(
    //                   height: 5,
    //                 ),
    //                 Text(fruit.price),
    //                 SizedBox(
    //                   height: 5,
    //                 ),
    //                 Text(fruit.desc)
    //               ],
    //             ),
    //           )
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
