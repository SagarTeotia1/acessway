import 'dart:ui';
import 'package:acessway/Screen/HomeScreen/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX for navigation
import 'package:acessway/Const/const_colo.dart';
import 'package:acessway/Const/const_img.dart'; // Assuming the path to images
import 'package:acessway/Widgets/HomePage/SearchList.dart';

class SearchResultsPage extends StatelessWidget {
  final String query;

  const SearchResultsPage({Key? key, required this.query}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: homeBg,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Use Get.off() to navigate to the HomeScreen and remove current screen from stack
            Get.off(() => HomeScreen());
          },
        ),
        title: Text('$query'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 40),
              feedeventCardNearby(query), // Pass query to the card
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
