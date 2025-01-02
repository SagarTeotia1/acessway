import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:acessway/Const/const_colo.dart';
import 'package:acessway/Const/const_img.dart';
import 'package:acessway/Screen/HomeScreen/HomeScreen.dart';

class VirtualTourScreen extends StatelessWidget {
  const VirtualTourScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      backgroundColor: homeBg,
      body: isLandscape
          ? Row(
              children: [
                _buildImageSection(context),
                Expanded(child: _buildDetailsSection(context)),
              ],
            )
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: _buildImageSection(context),
                ),
                Expanded(child: _buildDetailsSection(context)),
              ],
            ),
      bottomNavigationBar: _buildBottomNavigationBar(),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  Widget _buildImageSection(BuildContext context) {
    return Expanded(
      child: Container(
        constraints: const BoxConstraints(minHeight: 200, maxHeight: 300),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  'assets/images/SuperMarket.jpg', // Assuming you have an image for supermarket
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 16,
                left: 16,
                child: CircleAvatar(
                  backgroundColor: Colors.black.withOpacity(0.5),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Get.off(() => HomeScreen()),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailsSection(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitleAndAccessibility(),
          const SizedBox(height: 16),
          _buildReview(),
          const SizedBox(height: 16),
          _buildDescription(),
        ],
      ),
    );
  }

  Widget _buildTitleAndAccessibility() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Supermarket", // Changed from Eiffel Tower to Supermarket
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(
              "City Center", // Changed from Paris, France to City Center
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
        const AccessibilityWidget(rating: 4.5),
      ],
    );
  }

  Widget _buildReview() {
    return Row(
      children: const [
        Icon(Icons.star, color: Colors.yellow),
        SizedBox(width: 4),
        Text(
          "4.8 (147 Reviews)", // Leave as is for now, or change based on supermarket reviews
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildDescription() {
    return const Text(
      "Our Supermarket offers a wide range of fresh products, groceries, household items, and more. Experience shopping at its finest with excellent customer service and unbeatable prices.",
      style: TextStyle(fontSize: 14, height: 1.5), // Updated the description
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomAppBar(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton.icon(
          onPressed: _startARNavigation,
          icon: const Icon(
            Icons.view_in_ar,
            color: Colors.white,
          ),
          label: const Text(
            'Start AR Navigation',
            style: TextStyle(color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: homeBg,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            minimumSize: const Size(double.infinity, 50),
          ),
        ),
      ),
    );
  }

  Future<void> _startARNavigation() async {
    const arUrl = 'https://ar-navigation.example.com';
    if (await canLaunchUrl(Uri.parse(arUrl))) {
      await launchUrl(Uri.parse(arUrl));
    } else {
      throw 'Could not launch $arUrl';
    }
  }

  Widget _buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: _showReviewSnackbar,
      backgroundColor: homeBg,
      child: const Icon(
        Icons.add_comment,
        color: Colors.white, // Set icon color to white
      ),
    );
  }

  void _showReviewSnackbar() {
    Get.snackbar(
      'Add a Review',
      'You can add a review or create a post for this location!',
      backgroundColor: homeBg,
      colorText: Colors.white,
    );
  }
}

class AccessibilityWidget extends StatelessWidget {
  final double rating;

  const AccessibilityWidget({required this.rating});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Accessibility",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          "$rating/5",
          style: const TextStyle(color: Colors.green, fontSize: 16),
        ),
      ],
    );
  }
}
