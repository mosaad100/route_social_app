import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/core/utils/images.dart';
import 'package:social_media_app/features/home_screen/presentation/pages/home_layout.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        duration: 3000,
        splash: Image.asset(
          LocalImages.appIcon,
        ),
        splashIconSize: 600,
        nextScreen: const HomeLayOut(),
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: Colors.black);
  }
}
