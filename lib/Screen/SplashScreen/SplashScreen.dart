import 'package:acessway/Const/const_colo.dart';
import 'package:acessway/Const/const_fonts.dart';
import 'package:acessway/Screen/AUTH/Choose_avtarScreen.dart';
import 'package:acessway/Widgets/Splash/AppiconWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animated_text_kit/animated_text_kit.dart'; // Import the animated_text_kit package

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to ChooseAvatarScreen after 2 seconds
    Future.delayed(Duration(seconds: 2), () {
      Get.off(() => ChooseAvatarScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset(
            'assets/images/splashpagebg.png',
            fit: BoxFit.cover,
          ),
          // Content
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppIconWidget(),
                  const SizedBox(height: 15),
                  Text(
                    "AccessWay",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: regularfont,
                    ),
                  ),
                  const SizedBox(height: 25),
                  // Animated Text using AnimatedTextKit
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8, // Set width to avoid text overflow
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText(
                          "Accessibility in Motion, Everywhere You Go",
                          speed: const Duration(milliseconds: 100),
                          textStyle: TextStyle(
                            fontSize: 14,
                            fontFamily: itallicfont,
                            color: darktheme,
                          ),
                        ),
                      ],
                      isRepeatingAnimation: false, // Set to false to show the animation once
                      onFinished: () {
                        // Optionally do something when the animation finishes
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
