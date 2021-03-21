import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/models/fruit.dart';
import 'package:store/screens/edit_fruit.dart';

class Fruits extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final fruits = Provider.of<List>(context);
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Fruits")),
        actions: [
          IconButton(
            icon: Icon(
              Icons.add,
              size: 30,
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => EditFruit(),
                ),
              );
            },
          ),
        ],
      ),
      body: (fruits != null)
          ? Builder(builder: (BuildContext newContext) {
              return ListView.builder(
                  itemCount: fruits.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 2.0, horizontal: 10),
                      child: Card(
                        child: Container(
                          height: 80,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Column(
                              children: [
                                ListTile(
                                  autofocus: true,
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            EditFruit(fruits[index]),
                                      ),
                                    );
                                  },
                                  title: Text(
                                    fruits[index].name,
                                    style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  subtitle: Text(
                                    fruits[index].des,
                                    style: TextStyle(
                                        // fontWeight: FontWeigh,
                                        ),
                                  ),
                                  trailing: Text(
                                    "Rs.${fruits[index].price.toString()}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  });
            })
          : Center(child: CircularProgressIndicator()),
    );
  }
}
