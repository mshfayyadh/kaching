import 'package:flutter/material.dart';
import 'package:ka_ching/screens/about.dart';
import 'package:ka_ching/screens/login.dart';
import 'screens/Addscreen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AboutScreen(),//WelcomeScreen(),//Addscreen(),
    );
  }
}


