import 'package:flutter/material.dart';
import 'package:ka_ching/models/expense.dart';
import 'package:ka_ching/models/income.dart';
import 'package:ka_ching/models/profile_data.dart';
import 'package:ka_ching/screens/login.dart';
import 'package:ka_ching/screens/my_profile.dart';
import 'package:ka_ching/screens/previous_records.dart';
import 'package:ka_ching/screens/splashScreen.dart';
import 'screens/about.dart';
import 'screens/addScreen.dart';
import 'screens/dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  ProfileData profile = new ProfileData("Afif", "Marzuqi", "am@gmail.com", "013-3333310");

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
        '/load': (context) => SplashScreen(),
        '/id': (context) =>dashboardScreen(),
        '/add': (context) => Addscreen(),
        '/record': (context) => PreviousRec(),
        '/profile': (context) => MyProfile(profile),
        '/about': (context) => AboutScreen(),
      },
    );
  }
}
