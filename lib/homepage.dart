import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fruitstore/addFruit.dart';
import 'package:fruitstore/database.dart';
import 'package:fruitstore/detailsPage.dart';
import 'package:fruitstore/fruitListWidget.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Database _database;
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("fruits");

  Map data;

  fetchData() {
    collectionReference.snapshots().listen((event) {
      setState(() {
        if (event == null) data = {"name": null};
        // data = event.documents[0].data;
      });
    });
  }

  addData() {
    print("Inside");
    Map<String, dynamic> data = {
      "name": "Banana",
      "image": null,
      "price": "50",
      "decs": "Tasty"
    };
    collectionReference.add(data);
  }

  deleteData() async {
    // QuerySnapshot querySnapshot = await collectionReference.getDocuments();
    // querySnapshot.documents[0].reference.delete();
  }

  updateData() async {
    // QuerySnapshot querySnapshot = await collectionReference.getDocuments();
    // querySnapshot.documents[0].reference.updateData({"name": "Cherry"});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF21BFBD),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.white,
                  onPressed: () {},
                ),
                Container(
                    width: 125.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.filter_list),
                          color: Colors.white,
                          onPressed: () {},
                        ),
                      ],
                    ))
              ],
            ),
          ),
          SizedBox(height: 25.0),
          Padding(
            padding: EdgeInsets.only(left: 40.0),
            child: Row(
              children: <Widget>[
                Text('Healthy',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0)),
                SizedBox(width: 10.0),
                Text('Fruits',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontSize: 25.0))
              ],
            ),
          ),
          SizedBox(height: 40.0),
          Container(
            height: MediaQuery.of(context).size.height - 185.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0)),
            ),
            child: ListView(
              primary: false,
              padding: EdgeInsets.only(left: 25.0, right: 20.0),
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 45.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height - 300.0,
                    child: ListView(
                      children: [
                        FloatingActionButton.extended(
                          onPressed: fetchData,
                          isExtended: true,
                          backgroundColor: Color(0xFF21BFBD),
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          icon: Icon(Icons.add),
                          label: Text('Fetch Fruit'),
                        ),
                        Text(data.toString()),
                        FloatingActionButton.extended(
                          onPressed: deleteData,
                          isExtended: true,
                          backgroundColor: Color(0xFF21BFBD),
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          icon: Icon(Icons.delete),
                          label: Text('Delete Fruit'),
                        ),
                        Text(data.toString()),

                        FloatingActionButton.extended(
                          onPressed: updateData,
                          isExtended: true,
                          backgroundColor: Color(0xFF21BFBD),
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          icon: Icon(Icons.add),
                          label: Text('update Fruit'),
                        ),
                        Text(data.toString()),
                        // _buildFoodItem(
                        //     'assets/plate1.png', 'Salmon bowl', '\$24.00'),
                        // _buildFoodItem(
                        // 'assets/plate2.png', 'Spring bowl', '\$22.00'),
                        // _buildFoodItem(
                        // 'assets/plate6.png', 'Avocado bowl', '\$26.00'),
                        // _buildFoodItem(
                        //     'assets/plate5.png', 'Berry bowl', '\$24.00')

                        FruitListWidget(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     showDialog(
      //         context: context,
      //         child: AddFruitDialogWidget(),
      //         barrierDismissible: false);
      //   },
      //   isExtended: true,
      //   backgroundColor: Color(0xFF21BFBD),
      //   materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      //   icon: Icon(Icons.add),
      //   label: Text('Add Fruit'),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
          context: context,
          builder: (context) => AddFruitDialogWidget(),
          barrierDismissible: false,
        ),
        child: Icon(Icons.add),
        isExtended: true,
        backgroundColor: Color(0xFF21BFBD),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        // icon: Icon(Icons.add),
        // label: Text('Add Fruit'),
      ),
    );
  }

  Widget _buildFoodItem(String imgPath, String foodName, String price) {
    return Padding(
      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DetailsPage(
                  heroTag: imgPath, foodName: foodName, foodPrice: price)));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
                child: Row(children: [
              Hero(
                  tag: imgPath,
                  child: Image(
                      image: AssetImage(imgPath),
                      fit: BoxFit.cover,
                      height: 75.0,
                      width: 75.0)),
              SizedBox(width: 10.0),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(foodName,
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold)),
                Text(price,
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 15.0,
                        color: Colors.grey))
              ])
            ])),
          ],
        ),
      ),
    );
  }
}

// IconButton(
// icon: Icon(Icons.add),
// color: Colors.black,
// onPressed: () {})
