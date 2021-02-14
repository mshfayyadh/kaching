import 'package:flutter/material.dart';
import 'package:ka_ching/screens/viewmodel/profile_viewmodel.dart';

import '../view.dart';

class WelcomeScreen extends StatelessWidget {
  TextEditingController usrname = new TextEditingController();
  TextEditingController pass = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: <
                    Widget>[
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
          controller: usrname,
          style: TextStyle(fontSize: 15.0, height: 1.0, color: Colors.black),
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 10.0, 10.0),
              hintText: "Username (first name)",
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
          style: TextStyle(fontSize: 15.0, height: 1.0, color: Colors.black),
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
      View<ProfileViewModel>(
        initViewmodel: (viewmodel) => viewmodel.getUsers(),
        builder: (context,viewmodel,_) {
          bool exist = viewmodel.checkUser(username: usrname.text, password: pass.text);
          return FlatButton(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 133),
            color: Colors.yellow,
            textColor: Colors.white,
            onPressed: () {
              if(!exist)
              Navigator.pushNamed(context, '/load');
              // else
              // Text("Not found");
            },
            child: Text("Login",
                style: TextStyle(
                    fontSize: 19.0, height: 1.0, fontWeight: FontWeight.bold)),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          );
        },
      ),
      SizedBox(height: 5),
      Text(
        "Forgot your password?",
        style: TextStyle(fontSize: 13.0, color: Colors.redAccent),
      ),
      SizedBox(height: 2),
      Text(
        "Don't have an account? Sign up.",
        style: TextStyle(fontSize: 13.0, color: Colors.grey),
      ),
      SizedBox(height: 10),
      FlatButton(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 120),
        color: Colors.yellow,
        textColor: Colors.white,
        onPressed: () {
          Navigator.pushNamed(context, '/register');
        },
        child: Text("Register",
            style: TextStyle(
                fontSize: 19.0, height: 1.0, fontWeight: FontWeight.bold)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
    ])));
  }
}
