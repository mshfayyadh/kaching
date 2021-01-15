import 'package:flutter/material.dart';
import 'package:ka_ching/models/expense.dart';
import 'package:ka_ching/models/income.dart';
import 'package:ka_ching/screens/login.dart';
import 'package:ka_ching/screens/previous_records.dart';
import 'screens/about.dart';
import 'screens/addScreen.dart';
import 'screens/dashboard.dart';

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
        '/': (context) => WelcomeScreen(),
        '/id': (context) =>dashboardScreen(),
        '/add': (context) => Addscreen(),
        '/record': (context) => PreviousRec(),
        '/about': (context) => AboutScreen(),
      },
    );
  }
}
