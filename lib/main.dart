import 'package:flutter/material.dart';
import 'package:ka_ching/screens/dashboard.dart';
import 'screens/addScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      //home: AboutScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => dashboardScreen(),
        '/second': (context) => Addscreen(),
      },
    );
  }
}

