import 'package:flutter/material.dart';
import 'package:fruitstore/addFruit.dart';
import 'package:fruitstore/database.dart';
import 'package:fruitstore/detailsPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruitstore/fruits.dart';
import 'package:fruitstore/homepage.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FruitProvider(),
      child: MaterialApp(
        home: MyHomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
