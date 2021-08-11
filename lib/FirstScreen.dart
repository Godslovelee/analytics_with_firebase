//import 'dart:js';

import 'package:flutter/material.dart';
import 'main.dart';
import 'SecondScreen.dart';
import 'package:path/path.dart' as Path;

class YoFirst extends StatefulWidget {
  // const YoFirst({Key? key}) : super(key: key);

  @override
  _YoState createState() => _YoState();
}

class _YoState extends State<YoFirst> {
  void second_thing() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => Second(passedman: "hello man")));
  }







  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("Yo StopDcar"),
          onPressed: second_thing,
        ),
      ),
    );
  }
}

/*
class FirstScreen extends StatelessWidget {
  void yo(){

  }

/*


 */


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello"),
      ),
      body: Center(

        child: RaisedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Secound_MyApp(passedman: "Hello",)));
    }



          },
          child: Text("Hello"),
        ),
      ),
    );
  }



}
*/
