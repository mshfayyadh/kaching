import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
          Container(
            child: Image(
              height: 200,
              width: 200,
              image: AssetImage('assets/images/logo2.png'),
            ),
          ),
          SizedBox(height: 30),
          Container(
            width: 300.0,
            child: TextField(
              style:
                  TextStyle(fontSize: 15.0, height: 1.0, color: Colors.black),
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 10.0, 10.0),
                  hintText: "Username",
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
              Navigator.pushNamed(context, '/load');
            },
            child: Text("Login", style: TextStyle(fontSize: 19.0, height: 1.0, fontWeight: FontWeight.bold)),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          ),
          SizedBox(height: 15),
          Text(
            "Forgot your password?",
            style: TextStyle(fontSize: 13.0, color: Colors.redAccent),
          ),
          SizedBox(height: 2),
          Text(
            "Don't have an account? Sign up.",
            style: TextStyle(fontSize: 13.0, color: Colors.grey),
          ),
        ])));
  }
}
