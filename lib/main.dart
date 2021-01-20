import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';

import 'models/profile_data.dart';
import 'screens/login.dart';
import 'screens/my_profile.dart';
import 'screens/previous_records.dart';
import 'screens/settings.dart';
import 'screens/splashScreen.dart';
import 'screens/about.dart';
import 'screens/addScreen.dart';
import 'screens/dashboard.dart';

ProfileData profile = new ProfileData("Afif", "Marzuqi", "am@gmail.com", "013-3333310");
var brightness = Brightness.light;
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
    
  @override
  Widget build(BuildContext context) {
    return  DynamicTheme(
      defaultBrightness: Brightness.light,
      data: (brightness) => ThemeData(primaryColor: Colors.white, brightness: brightness),
      themedWidgetBuilder: (context, theme) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme,
          initialRoute: '/',
          routes: {
            '/': (context) => WelcomeScreen(),
            '/load': (context) => SplashScreen(),
            '/id': (context) => dashboardScreen(),
            '/add': (context) => Addscreen(),
            '/record': (context) => PreviousRec(),
            '/profile': (context) => MyProfile(profile),
            '/setting': (context) => Settings(),
            '/about': (context) => AboutScreen(),
          },
        );
      }
    );
  }
}
