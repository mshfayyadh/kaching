import 'package:flutter/material.dart';
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
        '/': (context) => dashboardScreen(),
        '/add': (context) => Addscreen(),
        '/about': (context) => AboutScreen(),
      },
    );
  }
}
