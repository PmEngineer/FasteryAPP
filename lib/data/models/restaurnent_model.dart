// lib/data/models/restaurnent_model.dart (Mandatory Update)

class Restaurant {
  final String name;
  final String category;
  final double rating;
  final String reviewCount;
  final String deliveryTime;
  final String distance;
  final String imageUrl;
  final String itemPrice;
  final bool isFeatured;
  // ✅ ADD THIS FIELD
  final String categoryTag;

  // ✅ UPDATE THE CONSTRUCTOR
  Restaurant({
    required this.name,
    required this.category,
    required this.rating,
    required this.reviewCount,
    required this.deliveryTime,
    required this.distance,
    required this.imageUrl,
    required this.itemPrice,
    this.isFeatured = false,
    required this.categoryTag, // Add this required parameter
  });
}