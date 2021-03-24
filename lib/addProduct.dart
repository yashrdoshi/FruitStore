import 'package:flutter/material.dart';

class AddProductWidget extends StatelessWidget {
  final String name;
  final String url;
  final String price;
  final String desc;
  final ValueChanged<String> onChangedName;
  final ValueChanged<String> onChangedUrl;
  final ValueChanged<String> onChangedPrice;
  final ValueChanged<String> onChangedDesc;
  final ValueChanged<String> onSavedTodo;

  const AddProductWidget({
    Key key,
    this.name = '',
    this.url = '',
    this.price = '',
    this.desc = '',
    this.onChangedName,
    this.onChangedUrl,
    this.onChangedPrice,
    this.onChangedDesc,
    this.onSavedTodo,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildName(),
            buildDescription(),
            buildPrice(),
            buildUrl(),
            buildButton(),
          ],
        ),
      );

  Widget buildPrice() => TextFormField(
        maxLines: 1,
        initialValue: price,
        onChanged: onChangedPrice,
        validator: (price) {
          if (price.isEmpty) {
            return 'Price cannot be empty';
          }
          return null;
        },
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Price',
        ),
      );

  Widget buildUrl() => TextFormField(
        maxLines: 1,
        initialValue: url,
        onChanged: onChangedUrl,
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Name',
        ),
      );

  Widget buildName() => TextFormField(
        maxLines: 1,
        initialValue: name,
        onChanged: onChangedName,
        validator: (name) {
          if (name.isEmpty) {
            return 'Name cannot be empty';
          }
          return null;
        },
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Name',
        ),
      );

  Widget buildDescription() => TextFormField(
        maxLines: 1,
        initialValue: desc,
        onChanged: onChangedDesc,
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Description',
        ),
      );

  Widget buildButton() => SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.black),
          ),
          onPressed: () {},
          child: Text('Save'),
        ),
      );
}
