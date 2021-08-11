import 'main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'SecondScreen.dart';
import 'FirstScreen.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

void main() {
  runApp(MyAppWar(
    Passed: 'Hello',
  ));
}

class MyAppWar extends StatelessWidget {
  final String Passed;
  MyAppWar({required this.Passed});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Hello", home: MyHomeScreen());
  }
}

class MyHomeScreen extends StatefulWidget {
  @override
  _MyHomeScreen createState() => _MyHomeScreen();
}

class _MyHomeScreen extends State<MyHomeScreen> {
  //final String snackBar;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Hello"),
          actions: <Widget>[
            Builder(builder: (BuildContext context) {
              return FlatButton(
                child: Text("click"),
                textColor: Theme.of(context).buttonColor,
                onPressed: () async {
                  final FirebaseUser FireUser =
                      _auth.currentUser() as FirebaseUser;
                  if (FireUser == null) {
                    final snackBar =
                        SnackBar(content: Text("No one signed in"));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    //return;<
                  }
                  await _auth.signOut();
                  final String uid = FireUser.uid;
                  final snackBar2 =
                      SnackBar(content: Text(uid + "User has signed out"));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar2);
                },
              );
            })
          ],
        ),
        body: Builder(builder: (BuildContext context) {
          return ListView(
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.all(12),
            children: /*<Widget>*/ [_RegisterEmailSection()],
          );
        }));
  }
}

class _RegisterEmailSection extends StatefulWidget {
  final String title = 'Registration';
  @override
  State<StatefulWidget> createState() => _RegisterEmailSectionState();
}

class _RegisterEmailSectionState extends State<_RegisterEmailSection> {
  @override
  void disposeFire() {
    _emailtextcontroller.dispose();
    _passwordtextcontroller.dispose();
    super.dispose();
  }

  void _register() async {
    final FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
      email: _emailtextcontroller.text,
      password: _passwordtextcontroller.text,
    ))
        .user;
    if (user != null) {
      setState(() {
        _sucess = true;
        _useremail = user.email;
      });
    } else {
      setState(() {
        _sucess = true;
      });
    }
  }

  final TextEditingController _emailtextcontroller = TextEditingController();
  final TextEditingController _passwordtextcontroller = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  late bool _sucess;
  late final String _useremail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Form(
        key: _formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              controller: _emailtextcontroller,
              decoration: InputDecoration(labelText: 'Email'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'please enter your email';
                }
                //return null;
              },
            ),
            TextFormField(
              controller: _passwordtextcontroller,
              decoration: const InputDecoration(labelText: 'Password'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              alignment: Alignment.center,
              child: RaisedButton(
                onPressed: () async {
                  if (_formkey.currentState!.validate()) {
                    return _register();
                  }
                },
                child: const Text('Submit'),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(_sucess == null
                  ? ''
                  : (_sucess
                      ? 'Successfully registered ' + _useremail
                      : 'Registration failed')),
            )
          ],
        ),
      ),
    );
  }
}
