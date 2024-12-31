import 'package:acessway/Const/const_img.dart';
import 'package:flutter/material.dart';

class AppIconWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.transparent), // Black border
        borderRadius: BorderRadius.circular(25), // Rounded corners
        color: Colors.white,
      ),
      padding: EdgeInsets.all(15), // Space between the image and the border
      child: Image.asset(
        appiconlogo,
        fit: BoxFit.cover,
      ),
    );
  }
}
