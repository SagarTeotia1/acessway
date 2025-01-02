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
              color: Colors.blue,
            ),
            child: Text('Menu'),
          ),
          ListTile(
            title: const Text('Profile'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Settings'),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildBackgroundImage() {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      child: Image.asset(
        bgImages[selectedFilter]!,
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: filters
            .where((filter) => filter != "None")
            .map((filter) => FilterChip(
                  label: Text(filter),
                  selected: selectedFilter == filter,
                  onSelected: (bool selected) {
                    setState(() {
                      selectedFilter = selected ? filter : "None";
                    });
                  },
                ))
            .toList(),
      ),
    );
  }

  Widget _buildDraggableSheet() {
    return DraggableScrollableSheet(
      initialChildSize: 0.2,
      minChildSize: 0.1,
      maxChildSize: 0.5,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
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
              Expanded(
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: const Icon(Icons.place),
                      title: Text('Place ${index + 1}'),
                      subtitle: const Text('Distance: 1.2 km'),
                      trailing: IconButton(
                        icon: const Icon(Icons.directions),
                        onPressed: () {},
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
