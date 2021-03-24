import 'package:flutter/material.dart';
import 'package:fruitstore/addProduct.dart';

class AddFruitDialogWidget extends StatefulWidget {
  @override
  _AddFruitDialogWidgetState createState() => _AddFruitDialogWidgetState();
}

class _AddFruitDialogWidgetState extends State<AddFruitDialogWidget> {
  final _formKey = GlobalKey<FormState>();

  String name = '';
  String url = 'null';
  String price = '';
  String desc = '';

  @override
  Widget build(BuildContext context) => AlertDialog(
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "ADD FRUIT",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            SizedBox(
              height: 2,
            ),
            AddProductWidget(
              onChangedName: (name) => setState(() => this.name = name),
              onChangedUrl: (url) => setState(() => this.url = url),
              onChangedPrice: (price) => setState(() => this.price = price),
              onChangedDesc: (desc) => setState(() => this.desc = desc),
              // onSavedTodo: () {},
            ),
          ],
        ),
      );
}
