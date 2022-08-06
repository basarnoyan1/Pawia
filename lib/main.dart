import 'package:flutter/material.dart';
import 'package:takeep_pet/flycontrol.dart';
//import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Takeep',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        fontFamily: 'MuseoSans',
      ),
      home: FlyControl(),
    );
  }
}
