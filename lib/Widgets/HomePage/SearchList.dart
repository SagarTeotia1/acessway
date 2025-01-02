import 'package:acessway/Const/const_colo.dart';
import 'package:flutter/material.dart';

Widget feedeventCardNearby(String query) {
  return SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
          locationCard(
          title: "$query SuperMarket",
          imagePath: 'assets/images/SuperMarket.jpg',
          rating: 4.8,
          accessibilityRating: 4.9,
          distance: "10.0 km",
          address: "Vasantkunj, 110045, India",
          phoneNumber: "+91 928-638-7888",
          hours: "24 Hours",
          onTap: () => print("Card tapped: Grand Canyon"),
        ),
        
        const SizedBox(height: 20),
        locationCard(
          title: "$query School",
          imagePath: 'assets/images/SearchSchool.jpg',
          rating: 4.5,
          accessibilityRating: 4.8,
          distance: "1.2 km",
          address: "Agra, Uttar Pradesh, India",
          phoneNumber: "+91 123 456 7890",
          hours: "9:00 AM - 5:00 PM",
          onTap: () => print("Card tapped: Taj Mahal"),
        ),
        const SizedBox(height: 20),
        locationCard(
          title: "$query Hospital",
          imagePath: 'assets/images/SearchHospital.jpg',
          rating: 5.0,
          accessibilityRating: 4.6,
          distance: "3.5 km",
          address: "Greater Kailash, 110023, India",
          phoneNumber: "+91 123 45 67 89",
          hours: "9:00 AM - 11:00 PM",
          onTap: () => print("Card tapped: Eiffel Tower"),
        ),
        const SizedBox(height: 20),
        locationCard(
          title: "$query Hotel",
          imagePath: 'assets/images/SearchHotel.jpg',
          rating: 4.0,
          accessibilityRating: 4.2,
          distance: "2.8 km",
          address: "Kalindi Kunj, 11002, India",
          phoneNumber: "+91 202 357 7890",
          hours: "8:00 AM - 6:00 PM",
          onTap: () => print("Card tapped: Great Pyramid of Giza"),
        ),
        const SizedBox(height: 20),
        locationCard(
          title: "$query SuperMarket",
          imagePath: 'assets/images/SuperMarket.jpg',
          rating: 4.8,
          accessibilityRating: 4.9,
          distance: "10.0 km",
          address: "Vasantkunj, 110045, India",
          phoneNumber: "+91 928-638-7888",
          hours: "24 Hours",
          onTap: () => print("Card tapped: Grand Canyon"),
        ),
        const SizedBox(height: 20),
      ],
    ),
  );
}

Widget locationCard({
  required String title,
  required String imagePath,
  required double rating,
  required double accessibilityRating,
  required String distance,
  required String address,
  required String phoneNumber,
  required String hours,
  required VoidCallback onTap,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey[300]!, width: 2),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 140,
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Icon(
                    Icons.bookmark,
                    color: homeBg,
                    size: 24,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 18),
                      Text(
                        "$rating",
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.amber,
                        ),
                      ),
                      Text(
                        " (${rating.toStringAsFixed(1)} stars)",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(Icons.accessibility, color: Colors.green, size: 18),
                      Text(
                        " Accessibility: $accessibilityRating",
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(Icons.location_on, size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          address,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.phone, size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(
                        phoneNumber,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.access_time, size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(
                        hours,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(Icons.directions_walk, size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(
                        "Distance: $distance",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
