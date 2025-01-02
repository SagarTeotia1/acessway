import 'package:acessway/Const/const_fonts.dart';
import 'package:acessway/Screen/HomeScreen/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class ChooseAvatarScreen extends StatefulWidget {
  const ChooseAvatarScreen({super.key});

  @override
  State<ChooseAvatarScreen> createState() => _ChooseAvatarScreenState();
}

class _ChooseAvatarScreenState extends State<ChooseAvatarScreen> {
  int _selectedAvatarIndex = -1; // To track the selected avatar index

  // List of avatar GLB file paths
  final List<String> avatarModels = [
    'assets/images/avatar.glb',
    'assets/images/animated_kamala_harris_standing__talking.glb',
    'assets/images/talking_justin_trudeau_avatar_for_narration.glb',
    'assets/images/animated_gerry_chicalo_standing__talking.glb',
  ];

  // List of avatar names to display below the model
  final List<String> avatarNames = [
    'Sagar',
    'Reet',
    'Ravana',
    'Sri',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/images/GETSTARTEDBG.png'), // Replace with your background image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 50),
                  const Text(
                    'Choose Your Guide',
                    style: TextStyle(
                      fontSize: 26,
                      fontFamily: itallicfont,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  // Displaying all avatars in a list with uniform styling
                  ...avatarModels.asMap().entries.map((entry) {
                    int index = entry.key;
                    String model = entry.value;
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedAvatarIndex = index;
                          });
                        },
                        child: Container(
                          width: 250,
                          height: 360,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 10,
                                offset: Offset(0, 5),
                              ),
                            ],
                            border: Border.all(
                              color: _selectedAvatarIndex == index
                                  ? Colors.blue
                                  : Colors.transparent,
                              width: 3,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Constrained ModelViewer widget
                              Container(
                                width: 200,
                                height: 200,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: ModelViewer(
                                    backgroundColor: Colors.transparent,
                                    src: model,
                                    alt: 'Avatar ${index + 1}',
                                    ar: true,
                                    autoRotate: false,
                                    disableZoom: false,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                avatarNames[index],
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        width: 250, // Increased width
        child: FloatingActionButton.extended(
          onPressed: _selectedAvatarIndex == -1
              ? null
              : () {
                  print('Selected Avatar: $_selectedAvatarIndex');
                  Get.off(() => HomeScreen());
                },
          label: const Text(
            'Get Started',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: _selectedAvatarIndex == -1
              ? const Color(0xFFB2C9AD) // Disabled color
              : const Color(0xFF4B5945), // Active color
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
