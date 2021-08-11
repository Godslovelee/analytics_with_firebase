import 'main.dart';
import 'FirstScreen.dart';
import 'package:flutter/material.dart';

class Second extends StatefulWidget {
  final String passedman;
  Second({required this.passedman});


  @override
  _HoState createState() => _HoState();
}

class _HoState extends State<Second> {


  @override
  Widget build(BuildContext context) {

    void previous(){
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Second"),
      ),
      body: Center(
          child: Column(
            children: <Widget>[
              Column(
                children: [
                  RaisedButton(
                    child: Center(
                      child: Text("Go back"),

                    ),
                    onPressed: () => previous() ,
                  ),
                ],
              ),
              Text(widget.passedman)
            ],
          )),
    );
  }
}

/*
class Secound_MyApp extends StatelessWidget {
  final String passedman;
  Secound_MyApp({this.passedman});


  void previous(){
    Navigator.pop(context);
  }

  //const Secound_MyApp({Key key, this.passedman}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second"),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          RaisedButton(
            child: Center(
              child: Text("Go baxk"),

            ),
            onPressed: () => previous() ,
          ),
          Text(widget.passedman)
        ],
      )),
    );
  }
}
*/
