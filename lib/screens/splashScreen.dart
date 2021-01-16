import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:ka_ching/screens/dashboard.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 2500,
      splash: Container(
          child: Image(
        height: 800,
        width: 800,
        image: AssetImage('assets/images/logo2.png'),
      )),
      nextScreen: dashboardScreen(),
      splashTransition: SplashTransition.fadeTransition,
      //pageTransitionType: PageTransitionType.scale,
    );
  }
}
