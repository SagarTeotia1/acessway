import 'package:acessway/Const/const_colo.dart';
import 'package:flutter/material.dart';
import 'package:acessway/Widgets/Review/SocialScreenWidget.dart';

class SocialScreen extends StatefulWidget {
  const SocialScreen({super.key});

  @override
  State<SocialScreen> createState() => _SocialScreenState();
}

class _SocialScreenState extends State<SocialScreen> {
  // Function to show a dialog for adding a post/review
  void _showAddPostDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add a Post'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Text Field for writing a post or review
              TextField(
                decoration: InputDecoration(hintText: 'Enter your post here...'),
                maxLines: 4,
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Handle the post submission here
                  Navigator.pop(context);
                  // You can add your logic to save the post here
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Post Submitted!')),
                  );
                },
                child: Text('Add Post'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: homeBg, // Custom background color for the button
                ),
              ),
            ],
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
        icon: Icon(Icons.add,color: Colors.white,),
        label: Text('Create a Post',style: TextStyle(color: Colors.white),), // Text for the button
        backgroundColor: homeBg,  // FAB color
        tooltip: 'Create a Post/Review',
      ),
    );
  }
}
