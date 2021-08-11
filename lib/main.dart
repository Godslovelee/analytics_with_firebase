import 'package:flutter/material.dart';
import 'FirstScreen.dart';
import 'MainFire.dart';

void main() {
  runApp(MyAppWar(Passed: 'Hello',));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: YoFirst()
    );



  }
}



