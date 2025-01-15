import 'package:acessway/Const/const_colo.dart';
import 'package:acessway/Widgets/Review/SocialScreenWidget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io'; // For using File class

class SocialScreen extends StatefulWidget {
  const SocialScreen({super.key});

  @override
  State<SocialScreen> createState() => _SocialScreenState();
}

class _SocialScreenState extends State<SocialScreen> {
  // Controllers for the text fields
  TextEditingController _postController = TextEditingController();
  File? _imageFile; // Variable to store selected image
  int _rating = 0; // Accessibility Rating state
  
  // Function to pick an image from the gallery or camera
  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    
    if (image != null) {
      setState(() {
        _imageFile = File(image.path); // Store the selected image
      });
    }
  }

  // Function to show the dialog for adding a post/review
  void _showAddPostDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add a Post'),
          content: SingleChildScrollView( // Add scrolling for large content
            child: Container(
              width: 350,  // Increase the width of the dialog
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text Field for writing a post or review
                  TextField(
                    controller: _postController,
                    decoration: InputDecoration(hintText: 'Enter your post here...'),
                    maxLines: 4,
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(height: 10),
                  
                  // Image picker button
                  ElevatedButton(
                    onPressed: _pickImage,
                    child: Text(_imageFile == null ? 'Pick an Image' : 'Change Image'),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  ),
                  SizedBox(height: 10),
                  
                  // Show selected image preview
                  _imageFile != null
                      ? Image.file(
                          _imageFile!,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        )
                      : Container(),
                  
                  SizedBox(height: 10),
                  
                  // Accessibility Rating Widget
Text('Accessibility Rating', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),

Row(
  mainAxisSize: MainAxisSize.min, // Reduces space by fitting content
  children: List.generate(5, (index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0), // Reduce horizontal padding between numbers
      child: InkWell(
        onTap: () {
          setState(() {
            _rating = index + 1; // Update accessibility rating
          });
        },
        child: Column(
          children: [
            Text(
              '${index + 1}', // Show the rating number
              style: TextStyle(
                fontSize: 16, // Adjust number size
                fontWeight: FontWeight.bold,
                color: _rating > index ? Colors.green : Colors.grey, // Color based on the rating
              ),
            ),
            Icon(
              _rating > index ? Icons.star : Icons.star_border,
              color: _rating > index ? Colors.green : Colors.grey,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }),
),

                  SizedBox(height: 10),
                  
                  // Submit Button
                  ElevatedButton(
                    onPressed: () {
                      // Handle post submission here
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Post Submitted!')),
                      );
                      _postController.clear(); // Clear text after submitting
                      setState(() {
                        _imageFile = null; // Clear image after submitting
                        _rating = 0; // Reset rating
                      });
                    },
                    child: Text('Add Post'),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reviews'),
        centerTitle: true,
        backgroundColor: Colors.white,  // AppBar color
        elevation: 1,
      ),
      body: SingleChildScrollView(  // Add scrolling to avoid overflow
        child: Padding(
          padding: const EdgeInsets.all(8.0),  // Adding padding for better spacing
          child: Column(
            children: [
              SizedBox(height: 20),  // Add spacing above the content
              RevieweventCardNearby(),
              SizedBox(height: 20),  // Add spacing above the content
              RevieweventCardNearby(),  // Your review card widget
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _showAddPostDialog,  // Show dialog to add a post or review
        icon: Icon(Icons.add, color: Colors.white),
        label: Text('Create a Post', style: TextStyle(color: Colors.white)),
        backgroundColor: color1,  // FAB color
        tooltip: 'Create a Post/Review',
      ),
    );
  }
}
