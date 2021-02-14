import 'package:flutter/material.dart';
import 'package:ka_ching/screens/viewmodel/profile_viewmodel.dart';

class registerScreen extends StatefulWidget {
  @override
  _registerScreenState createState() => _registerScreenState();
}

class _registerScreenState extends State<registerScreen> {
  TextEditingController first = new TextEditingController();
  TextEditingController last = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController phone = new TextEditingController();
  TextEditingController pass = new TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    first.dispose();
    last.dispose();
    email.dispose();
    phone.dispose();
    pass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: <
                    Widget>[
          Container(
            child: Image(
              height: 150,
              width: 150,
              image: AssetImage('assets/images/logo2.png'),
            ),
          ),
          SizedBox(height: 30),
          Container(
            width: 300.0,
            child: TextField(
              controller: first,
              style:
                  TextStyle(fontSize: 15.0, height: 1.0, color: Colors.black),
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 10.0, 10.0),
                  hintText: "First Name",
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.yellow, width: 2.0),
                      borderRadius: BorderRadius.circular(30.0)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0))),
            ),
          ),
          SizedBox(height: 10),
          Container(
            width: 300.0,
            child: TextField(
              controller: last,
              style:
                  TextStyle(fontSize: 15.0, height: 1.0, color: Colors.black),
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 10.0, 10.0),
                  hintText: "Last Name",
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.yellow, width: 2.0),
                      borderRadius: BorderRadius.circular(30.0)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0))),
            ),
          ),
          SizedBox(height: 10),
          Container(
            width: 300.0,
            child: TextField(
              controller: email,
              style:
                  TextStyle(fontSize: 15.0, height: 1.0, color: Colors.black),
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 10.0, 10.0),
                  hintText: "Email Address",
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.yellow, width: 2.0),
                      borderRadius: BorderRadius.circular(30.0)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0))),
            ),
          ),
          SizedBox(height: 10),
          Container(
            width: 300.0,
            child: TextField(
              controller: phone,
              style:
                  TextStyle(fontSize: 15.0, height: 1.0, color: Colors.black),
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 10.0, 10.0),
                  hintText: "Phone Number",
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.yellow, width: 2.0),
                      borderRadius: BorderRadius.circular(30.0)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0))),
            ),
          ),
          SizedBox(height: 10),
          Container(
            width: 300.0,
            child: TextField(
              controller: pass,
              obscureText: true,
              style:
                  TextStyle(fontSize: 15.0, height: 1.0, color: Colors.black),
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 10.0, 10.0),
                  hintText: "Password",
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.yellow, width: 2.0),
                      borderRadius: BorderRadius.circular(30.0)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0))),
            ),
          ),
          SizedBox(height: 30),
          FlatButton(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 133),
            color: Colors.yellow,
            textColor: Colors.white,
            onPressed: () {
              ProfileViewModel().addUser(
                first: first.text,
                last: last.text,
                email: email.text,
                phone: phone.text,
                pass: pass.text,
              );
              Navigator.pushNamed(context, '/load');
            },
            child: Text("Register",
                style: TextStyle(
                    fontSize: 19.0, height: 1.0, fontWeight: FontWeight.bold)),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          ),
          SizedBox(height: 15),
        ])));
  }
}
