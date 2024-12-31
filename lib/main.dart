import 'package:acessway/Const/const_Var.dart';
import 'package:acessway/Const/const_fonts.dart';
import 'package:acessway/Screen/SplashScreen/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(  // Use GetMaterialApp instead of MaterialApp
      debugShowCheckedModeBanner: false,  // Optional: Hides the debug banner
      home: const SplashScreen(),  // Set your initial screen
      title: appname,  // Use your app's name from const_Var.dart
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,  // Your background color
        fontFamily: regularfont,  // Your custom font from const_fonts.dart
      ),
    );
  }
}
