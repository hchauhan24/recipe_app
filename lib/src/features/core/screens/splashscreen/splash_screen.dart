import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../bottom_navigation/bottom_navigation.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  get splash => null;

  @override
  Widget build(BuildContext context) {
   
    var h = MediaQuery.of(context).size.height;
    return AnimatedSplashScreen(
      duration: 3000,
      splash: SizedBox(
        height: h,
        child: Lottie.asset(
            'assets/lottie/splash_animation.json',fit: BoxFit.cover),
      ),
      nextScreen: BottomNavigationTab(),
      backgroundColor:Theme.of(context).colorScheme.surface,
splashIconSize: 300,
    );
  }
}
