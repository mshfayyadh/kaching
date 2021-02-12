import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';

import 'models/profile_data.dart';
import 'screens/view/login.dart';
import 'screens/view/my_profile.dart';
import 'screens/view/previous_records.dart';
import 'screens/view/settings.dart';
import 'screens/view/splashScreen.dart';
import 'screens/view/about.dart';
import 'screens/view/addScreen.dart';
import 'screens/view/dashboard.dart';
import 'screens/view/register.dart';

ProfileData profile = new ProfileData(
    id: "1",
    first: "Afif",
    last: "Marzuqi",
    email: "am@gmail.com",
    phone: "013-3333310");
var brightness = Brightness.light;
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
        defaultBrightness: Brightness.light,
        data: (brightness) =>
            ThemeData(primaryColor: Colors.white, brightness: brightness),
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
              '/register': (context) => registerScreen(),
            },
          );
        });
  }
}
