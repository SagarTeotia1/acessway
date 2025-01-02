import 'package:acessway/Const/const_colo.dart';
import 'package:acessway/Screen/HomePage_Screen/SearchPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  String selectedFilter = "None";

  // Background assets with default image
  final Map<String, String> bgImages = {
    "None": "assets/images/dmap.png", // Default background image
    "Toilets": "assets/images/toiletmap.png",
    "Hotels": "assets/images/hotels.png",
    "Hospitals": "assets/images/hotels.png",
  };

  final List<String> filters = ["None", "Toilets", "Hotels", "Hospitals"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AccessWay'),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),
        ],
      ),
      drawer: _buildDrawer(),
      body: Stack(
        children: [
          _buildBackgroundImage(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSearchBar(),
              _buildFilterChips(),
              Flexible(
                child: _buildDraggableSheet(),
              ),
            ],
          ),
        ],
      ),
    );
  }

Widget _buildDrawer() {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            color: homeBg, // Assuming homeBg is your theme color
          ),
          child: UserAccountsDrawerHeader(
            
            accountName: Text('Sagar'),
            accountEmail: Text('EX.@accessway.com'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: AssetImage('assets/images/Sagar.jpg'), // Corrected this line
            ),
          ),
        ),
        // Profile Navigation
        ListTile(
          leading: const Icon(Icons.person),
          title: const Text('Profile'),
          onTap: () {
            // Navigate to Profile Page (e.g., using Navigator)
            Navigator.pushNamed(context, '/profile');
          },
        ),
        // Settings Navigation
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text('Settings'),
          onTap: () {
            // Navigate to Settings Page
            Navigator.pushNamed(context, '/settings');
          },
        ),
        // Accessibility Settings Navigation
        ListTile(
          leading: const Icon(Icons.accessibility),
          title: const Text('Accessibility Settings'),
          onTap: () {
            // Navigate to Accessibility Settings
            Navigator.pushNamed(context, '/accessibility-settings');
          },
        ),
        // Notifications Settings Navigation
        ListTile(
          leading: const Icon(Icons.notifications),
          title: const Text('Notifications'),
          onTap: () {
            // Navigate to Notifications Settings
            Navigator.pushNamed(context, '/notifications');
          },
        ),
        // Support Navigation
        ListTile(
          leading: const Icon(Icons.help),
          title: const Text('Support'),
          onTap: () {
            // Navigate to Support Page
            Navigator.pushNamed(context, '/support');
          },
        ),
        Divider(), // Divider line between sections
        // Feedback Navigation
        ListTile(
          leading: const Icon(Icons.feedback),
          title: const Text('Feedback'),
          onTap: () {
            // Navigate to Feedback Page
            Navigator.pushNamed(context, '/feedback');
          },
        ),
        // Logout Button
        ListTile(
          leading: const Icon(Icons.exit_to_app),
          title: const Text('Logout'),
          onTap: () {
            // Handle Logout (e.g., clear session and navigate back)
            Navigator.pop(context); // Close the drawer
            // Implement logout logic here
          },
        ),
      ],
    ),
  );
}



  Widget _buildBackgroundImage() {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      child: Image.asset(
        bgImages[selectedFilter]! ,
        key: ValueKey(selectedFilter),
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        onSubmitted: (value) {
          // Navigate to the SearchResultsPage using Get.off
          Get.off(() => SearchResultsPage(query: value));
        },
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          hintText: 'Search for places...',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ),
    );
  }

Widget _buildFilterChips() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal, // Make the row horizontally scrollable
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: filters
            .where((filter) => filter != "None")
            .map((filter) {
          IconData icon;
          Color chipColor;
          if (filter == "Toilets") {
            chipColor = homeBg;
          } else if (filter == "Hotels") {
            chipColor = homeBg;
          } else {
            chipColor = homeBg;
          }
          return Padding(
            padding: const EdgeInsets.only(right: 8.0), // Space between chips
            child: FilterChip(
              label: Row(
                children: [
                  Text(filter),
                ],
              ),
              selected: selectedFilter == filter,
              onSelected: (bool selected) {
                setState(() {
                  selectedFilter = selected ? filter : "None";
                });
              },
              selectedColor: chipColor,
              backgroundColor: Colors.grey[200],
            ),
          );
        }).toList(),
      ),
    ),
  );
}


 Widget _buildDraggableSheet() {
  final List<String> places = [
    'SBM Toilets',
    'BH Petrol Pump',
    'SDK Hospitals',
    'AZ Schools',
    'Greater Kailsh',
    'Vasant Kunj',
    'Sydney Opera House',
    'Machu Picchu',
    'Grand Canyon',
    'Pyramids of Giza',
  ];

  return DraggableScrollableSheet(
    initialChildSize: 0.2,
    minChildSize: 0.2,
    maxChildSize: 0.7,
    builder: (BuildContext context, ScrollController scrollController) {
      return Container(
        decoration: BoxDecoration(
          color: homeBg, // You can keep this for overall background if needed
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(16.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8.0,
            ),
          ],
        ),
        child: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Places Nearby',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(height: 8),
                  ],
                ),
              ),
              // List of places with white background for each list item
              ...places.map((place) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 16), // Add margin for spacing
                  padding: EdgeInsets.all(10), // Add padding inside the container
                  decoration: BoxDecoration(
                    color: Colors.white, // White background for each place item
                    borderRadius: BorderRadius.circular(8.0), // Rounded corners for the container
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 4.0,
                        spreadRadius: 1.0,
                      ),
                    ],
                  ),
                  child: ListTile(
                    leading: Icon(
                      Icons.location_on,
                      color: Colors.blue,
                    ),
                    title: Text(place),
                    subtitle: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Icon(Icons.accessible, size: 16, color: Colors.green),
                          SizedBox(width: 5),
                          Text('Accessibility Rating: 4'),
                          SizedBox(width: 10),
                          Text('Distance: 2.5 km'),
                        ],
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.directions),
                      onPressed: () {
                        // Action for directions
                      },
                    ),
                  ),
                );
              }).toList(),
            ],
          ),
        ),
      );
    },
  );
}
}
