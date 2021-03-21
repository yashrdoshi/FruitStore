import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/models/fruit.dart';
import 'package:store/provider/fruit_provider.dart';

class EditFruit extends StatefulWidget {
  final Fruit fruit;

  EditFruit([this.fruit]);
  @override
  _EditFruitState createState() => _EditFruitState();
}

class _EditFruitState extends State<EditFruit> {
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final desController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    priceController.dispose();
    desController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    if (widget.fruit == null) {
      //new
      nameController.text = "";
      priceController.text = "";
      desController.text = "";
      new Future.delayed(Duration.zero, () {
        final fruitProvider =
            Provider.of<FruitProvider>(context, listen: false);
        fruitProvider.loadValues(Fruit());
      });
    } else {
      //existing
      //update controllers
      nameController.text = widget.fruit.name;
      priceController.text = widget.fruit.price.toString();
      desController.text = widget.fruit.des;
      //update state
      new Future.delayed(Duration.zero, () {
        final fruitProvider =
            Provider.of<FruitProvider>(context, listen: false);
        fruitProvider.loadValues(widget.fruit);
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final fruitProvider = Provider.of<FruitProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Fruits"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                validator: (val) => val.isEmpty ? "Enter a Name" : null,
                controller: nameController,
                decoration: InputDecoration(hintText: "Fruit Name"),
                onChanged: (value) {
                  fruitProvider.changeName(value);
                },
              ),
              TextFormField(
                validator: (val) => val.isEmpty ? "Enter Price" : null,
                controller: priceController,
                decoration: InputDecoration(hintText: "Fruit Price"),
                onChanged: (value) {
                  fruitProvider.changePrice(value);
                },
              ),
              TextFormField(
                validator: (val) => val.isEmpty ? "Enter Description" : null,
                controller: desController,
                decoration: InputDecoration(
                  hintText: "Fruit Description",
                ),
                onChanged: (value) {
                  fruitProvider.changeDes(value);
                },
              ),
              SizedBox(height: 10),
              ElevatedButton(
                  clipBehavior: Clip.hardEdge,
                  child: Text("Save"),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      fruitProvider.saveFruit();
                      Navigator.of(context).pop();
                    }
                  }),
              widget.fruit != null
                  ? ElevatedButton(
                      child: Text("Delete"),
                      onPressed: () {
                        fruitProvider.removeFruit(widget.fruit.fruitId);
                        Navigator.of(context).pop();
                      })
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
