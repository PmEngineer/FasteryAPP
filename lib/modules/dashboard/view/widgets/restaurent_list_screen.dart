import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../data/models/restaurnent_model.dart';

class RestaurantListScreen extends StatelessWidget {
   RestaurantListScreen({super.key});

  final List<Restaurant> mockRestaurants = [
    Restaurant(
      name: 'Wendy\'s Burgers',
      category: 'Burgers, American, Fast Food...',
      rating: 4.4,
      reviewCount: '2.2K+',
      deliveryTime: '25-30 mins',
      distance: '1.2 km',
      imageUrl: 'https://www.thecityofldn.com/wp-content/uploads/2023/04/Leadenhall-65-Luisa-Tona-reduced-2000x1335.jpg', // Placeholder
      itemPrice: 'AT ₹59', categoryTag: 'Food',
    ),
    Restaurant(
      name: 'Pizza Hut',
      category: 'Pizzas',
      rating: 4.1,
      reviewCount: '2.6K+',
      deliveryTime: '25-30 mins',
      distance: '1.1 km',
      imageUrl: 'assets/pizza_hut.jpg', // Placeholder
      itemPrice: 'AT ₹99',
      isFeatured: true, categoryTag: 'Food',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: mockRestaurants.length,
      itemBuilder: (context, index) {
        final restaurant = mockRestaurants[index];
        return RestaurantListItem(restaurant: restaurant);
      },
    );
  }
}

class RestaurantListItem extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantListItem({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: (){
          Get.toNamed(Routes.SHOPDETAILS,);
        },
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _buildImageSection(context),
              _buildDetailsSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageSection(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 3,
      margin: const EdgeInsets.only(left: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        image: DecorationImage(
          image: NetworkImage(restaurant.imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: <Widget>[
          // Heart Icon (Top Right)
          const Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.all(4.0),
              child: Icon(
                Icons.favorite_border,
                color: Colors.white,
              ),
            ),
          ),
          // Price Tag (Bottom Left)
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              margin: const EdgeInsets.only(left: 4.0, bottom: 4.0),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Text(
                restaurant.itemPrice,
                style:GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailsSection() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 12.0, right: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            // Name and Menu Icon
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    restaurant.name,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const Icon(Icons.more_vert, color: Colors.grey),
              ],
            ),

            if (restaurant.isFeatured)
              Padding(
                padding: const EdgeInsets.only(top: 2.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.emoji_events, // Trophy icon
                      color: Color(0xFFC79237), // Golden color
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Best In ${restaurant.category.split(',').first}', // e.g., "Best In Pizza"
                      style: GoogleFonts.poppins(
                        color: Color(0xFFC79237),
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),

            // Rating, Time
            Row(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.green[700],
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    children: [
                      Text(
                        restaurant.rating.toString(),
                        style: const TextStyle(color: Colors.white, fontSize: 12),
                      ),
                      const Icon(Icons.star, color: Colors.white, size: 12),
                    ],
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  '(${restaurant.reviewCount})',
                  style: const TextStyle(fontSize: 12, color: Colors.black87),
                ),
                const Text(' • ', style: TextStyle(fontSize: 12, color: Colors.black54)),
                Text(
                  restaurant.deliveryTime,
                  style: const TextStyle(fontSize: 12, color: Colors.black87),
                ),
              ],
            ),

            // Category
            Text(
              restaurant.category,
              style: GoogleFonts.poppins(fontSize: 13, color: Colors.black54),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),

            // Location
            Text(
              'Kanpur road • ${restaurant.distance}',
              style: GoogleFonts.poppins(fontSize: 13, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}

