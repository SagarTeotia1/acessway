import 'package:flutter/material.dart';

Widget RevieweventCardNearby() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SingleChildScrollView(
        child: Column(
          children: [
            // Example review/story cards
            ReviewCard(
              title: "A Mesmerizing Journey",
              visitorName: "John Doe",
              profileImage: 'assets/images/SuperMarket.jpg',  // Replace with your image path
              reviewText: "Exploring the Taj Mahal was a once-in-a-lifetime experience!",
              imagePath: 'assets/images/SuperMarket.jpg',
              distance: 2.5,  // Distance in kilometers (or miles)
              accessibilityRating: 5,  // Rating added here
              onTap: () => print("Card tapped: A Mesmerizing Journey"),
            ),
            ReviewCard(
              title: "Unforgettable Memories",
              visitorName: "Jane Smith",
              profileImage: 'assets/images/SearchSchool.jpg',  // Replace with your image path
              reviewText: "Walking under the Eiffel Tower was magical!",
              imagePath: 'assets/images/SearchSchool.jpg',
              distance: 8.3,  // Distance in kilometers
              accessibilityRating: 4,  // Rating added here
              onTap: () => print("Card tapped: Unforgettable Memories"),
            ),
            ReviewCard(
              title: "Historical Wonders",
              visitorName: "Alex Johnson",
              profileImage: 'assets/images/SearchHotel.jpg',  // Replace with your image path
              reviewText: "The Great Pyramid of Giza left me speechless.",
              imagePath: 'assets/images/SearchHotel.jpg',
              distance: 12.1,  // Distance in kilometers
              accessibilityRating: 3,  // Rating added here
              onTap: () => print("Card tapped: Historical Wonders"),
            ),
            // Add more review cards if needed
          ],
        ),
      ),
    ],
  );
}

class ReviewCard extends StatefulWidget {
  final String title;
  final String visitorName;
  final String profileImage;
  final String reviewText;
  final String imagePath;
  final double distance;
  final int accessibilityRating;
  final VoidCallback onTap;

  const ReviewCard({
    required this.title,
    required this.visitorName,
    required this.profileImage,
    required this.reviewText,
    required this.imagePath,
    required this.distance,
    required this.accessibilityRating,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  _ReviewCardState createState() => _ReviewCardState();
}

class _ReviewCardState extends State<ReviewCard> {
  bool isLiked = false; // Track like button state
  bool isFollowed = false; // Track follow button state

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: InkWell(
        onTap: widget.onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: double.infinity, // Full width for consistency
          height: 380, // Increased height for better spacing
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.grey[300]!,
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 6,
                offset: Offset(2, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,  // Ensures Column takes only the required space
            children: [
              Stack(
                children: [
                  // Background image for the story card
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    child: Image.asset(
                      widget.imagePath,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 140, // Fixed height for the image
                    ),
                  ),
                  // Bookmark Icon
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Icon(
                      Icons.bookmark,
                      color: Color(0xFF91AC8F),
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
                    // Story/Review Title
                    Text(
                      widget.title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 6),
                    // Visitor's review text (Control text overflow with maxLines and ellipsis)
                    Text(
                      widget.reviewText,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                      maxLines: 3,  // Limit the lines of review text
                      overflow: TextOverflow.ellipsis,  // Ellipsis to avoid overflow
                    ),
                    SizedBox(height: 6),
                    // Distance Display
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 20,
                        ),
                        SizedBox(width: 5),
                        Text(
                          '${widget.distance} km away',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 6),
                    // Accessibility Rating (Stars) - Below Distance
                    Row(
                      children: [
                        Icon(
                          Icons.accessible_forward,
                          color: Colors.green,  // Accessibility icon color
                          size: 20,
                        ),
                        SizedBox(width: 5),
                        Row(
                          children: List.generate(5, (index) {
                            return Icon(
                              index < widget.accessibilityRating
                                  ? Icons.star
                                  : Icons.star_border,  // Filled star or empty star
                              color: Colors.green,  // Set the star color to green
                              size: 20,
                            );
                          }),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Visitor Profile Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 16,
                      backgroundImage: AssetImage(widget.profileImage),
                    ),
                    SizedBox(width: 10),
                    Text(
                      widget.visitorName,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                    Spacer(),
                    // Follow Button (Next to the visitor's name)
                    IconButton(
                      icon: Icon(
                        isFollowed ? Icons.favorite : Icons.favorite_border,
                        color: isFollowed ? Colors.red : Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          isFollowed = !isFollowed; // Toggle the follow state
                        });
                      },
                    ),
                    // Like Button
                    IconButton(
                      icon: Icon(
                        isLiked ? Icons.thumb_up : Icons.thumb_up_off_alt,
                        color: isLiked ? Colors.blue : Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          isLiked = !isLiked; // Toggle the like state
                        });
                      },
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
}
