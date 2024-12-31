import 'package:acessway/Const/const_colo.dart';
import 'package:acessway/Const/const_fonts.dart';
import 'package:acessway/Screen/AUTH/Choose_avtarScreen.dart';
import 'package:acessway/Widgets/Splash/AppiconWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to PreAuthScreen after 3 seconds
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
                    "HeritageSphere",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: regularfont,
                    ),
                  ),
                  const SizedBox(height: 25),
                  Text(
                    "Explore, Preserve, Empower",
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: itallicfont,
                      color: darktheme
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "– Virtually Anywhere",
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: itallicfont,
                      color: darktheme
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
