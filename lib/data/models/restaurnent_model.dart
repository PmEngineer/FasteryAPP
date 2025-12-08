class Restaurant {
  final String name;
  final String category;
  final double rating;
  final String reviewCount;
  final String deliveryTime;
  final String distance;
  final String imageUrl;
  final String itemPrice; // e.g., 'AT ₹59'
  final bool isFeatured; // For the 'Best in Pizza' badge

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
  });
}