import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import Get for reactive filtering
import 'package:google_fonts/google_fonts.dart'; // Import for GoogleFonts
import '../../../../data/models/restaurnent_model.dart';
import '../../controllers/home_controller.dart'; // Import controller
import 'restaurent_list_screen.dart'; // Assuming RestaurantListItem is here

class RestaurantListViewContent extends StatelessWidget {
  RestaurantListViewContent({super.key});

  // Data structure using Map for easy initialization before mapping to the model
  final List<Map<String, dynamic>> rawMockRestaurants = const [
    // Matches 'Fresh'
    {
      'name': 'SuperMart Groceries',
      'category': 'Grocery, Daily Essentials, Fruits & Veg',
      'rating': 4.6,
      'reviewCount': '5.1K+',
      'deliveryTime': '15-20 mins',
      'distance': '0.8 km',
      'imageUrl': 'https://plus.unsplash.com/premium_photo-1664202219877-b32fcd5aa731?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8c3VwZXIlMjBtYXJ0fGVufDB8fDB8fHww',
      'itemPrice': 'AT ₹10',
      'isFeatured': true,
      'categoryTag': 'Fresh',
    },
    // Matches 'All'
    {
      'name': 'Apollo Pharmacy',
      'category': 'Medicines, Healthcare, Wellness',
      'rating': 4.8,
      'reviewCount': '10K+',
      'deliveryTime': '20-25 mins',
      'distance': '1.5 km',
      'imageUrl': 'https://content.jdmagicbox.com/v2/comp/hyderabad/w2/040pxx40.xx40.181225105407.b7w2/catalogue/apollo-pharmacy-miyapur-hyderabad-chemists-ernkmwhl2p.jpg',
      'itemPrice': 'AT ₹20',
      'isFeatured': false,
      'categoryTag': 'All', // Default to All if no specific category applies
    },
    // Matches 'Electronics'
    {
      'name': 'Gadget Hub Electronics',
      'category': 'Electronics, Mobiles, Accessories',
      'rating': 4.2,
      'reviewCount': '1.2K+',
      'deliveryTime': '45-60 mins',
      'distance': '3.5 km',
      'imageUrl': 'https://images.unsplash.com/photo-1565211604822-2641d0b081a6?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8ZWxlY3Ryb25pY3MlMjBzaG9wfGVufDB8fDB8fHww',
      'itemPrice': 'AT ₹54',
      'isFeatured': false, // Add missing field for consistency
      'categoryTag': 'Electronics',
    },
    // Matches 'Maxover'
    {
      'name': 'Bookworm Nook',
      'category': 'Books, Stationery, Art Supplies',
      'rating': 4.7,
      'reviewCount': '800+',
      'deliveryTime': '30-40 mins',
      'distance': '2.1 km',
      'imageUrl': 'https://images.unsplash.com/photo-1640313172461-84c0081c27dd?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fHN0YXRpb25hcnklMjBzaG9wfGVufDB8fDB8fHww',
      'itemPrice': 'AT ₹20',
      'isFeatured': true,
      'categoryTag': 'Maxover',
    },
    // Matches 'Fresh'
    {
      'name': 'Fresh Paneer & Sweets',
      'category': 'Dairy & Sweets',
      'rating': 4.5,
      'reviewCount': '3.4K+',
      'deliveryTime': '20-30 mins',
      'distance': '1.0 km',
      'imageUrl': 'https://images.unsplash.com/photo-1760776140488-32fcfab4066a?q=80&w=870&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'itemPrice': 'AT ₹15',
      'isFeatured': false, // Add missing field for consistency
      'categoryTag': 'Fresh',
    },
    // Matches 'Maxover'
    {
      'name': 'Pet Planet Supplies',
      'category': 'Pet Food, Toys, Grooming',
      'rating': 4.3,
      'reviewCount': '1.9K+',
      'deliveryTime': '30-35 mins',
      'distance': '2.8 km',
      'imageUrl': 'https://images.unsplash.com/photo-1569267034662-77399a614620?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cGV0JTIwc2hvcHxlbnwwfHwwfHx8MA%3D%3D',
      'itemPrice': 'AT ₹22',
      'isFeatured': false,
      'categoryTag': 'Maxover',
    },
    // Matches 'Wedding'
    {
      'name': 'Fashion Fiesta Boutique',
      'category': 'Apparel, Accessories, Footwear',
      'rating': 4.0,
      'reviewCount': '4.9K+',
      'deliveryTime': '1-2 Days',
      'distance': '5.0 km',
      'imageUrl': 'https://images.unsplash.com/photo-1555529771-835f59fc5efe?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fGdhcm1lbnRzJTIwc2hvcCUyMHNob3B8ZW58MHx8MHx8fDA%3D',
      'itemPrice': 'AT ₹10',
      'isFeatured': true,
      'categoryTag': 'Wedding',
    },
    // --- NEW DATA ADDED ---
    // Matches 'Winter'
    {
      'name': 'Warm Wools and Sweaters',
      'category': 'Winter Wear, Jackets, Thermals',
      'rating': 4.4,
      'reviewCount': '1.5K+',
      'deliveryTime': '40-50 mins',
      'distance': '3.2 km',
      'imageUrl': 'https://images.unsplash.com/photo-1738037393973-e1f3808929d8?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8d2ludGVyJTIwY2xvdGglMjBzaG9wfGVufDB8fDB8fHww',
      'itemPrice': 'AT ₹15',
      'isFeatured': false,
      'categoryTag': 'Winter',
    },
    // Matches 'Wedding'
    {
      'name': 'Jewelry & Gifts Co.',
      'category': 'Rings, Necklaces, Wedding Gifts',
      'rating': 4.9,
      'reviewCount': '9.8K+',
      'deliveryTime': '1-2 Hours',
      'distance': '1.9 km',
      'imageUrl': 'https://plus.unsplash.com/premium_photo-1763825006977-1b7cf6d3b0ed?q=80&w=387&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'itemPrice': 'AT ₹5',
      'isFeatured': true,
      'categoryTag': 'Wedding',
    },
    // Matches 'Electronics'
    {
      'name': 'Mobile Service Center',
      'category': 'Repairs, Screen Replacement, Batteries',
      'rating': 4.1,
      'reviewCount': '2.5K+',
      'deliveryTime': '2-3 Hours',
      'distance': '0.5 km',
      'imageUrl': 'https://images.unsplash.com/photo-1609713363103-ad14249cc099?q=80&w=870&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'itemPrice': 'AT ₹10',
      'isFeatured': false,
      'categoryTag': 'Electronics',
    },
    // NEW SHOP - Matches 'Winter'
    {
      'name': 'The Coffee House Cafe',
      'category': 'Hot Beverages, Snacks, Baked Goods',
      'rating': 4.7,
      'reviewCount': '6.2K+',
      'deliveryTime': '15-25 mins',
      'distance': '0.3 km',
      'imageUrl': 'https://images.unsplash.com/photo-1511920170033-f8396924c348?q=80&w=870&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'itemPrice': 'AT ₹8',
      'isFeatured': true,
      'categoryTag': 'Winter', // Good for a cold day
    },
  ];

  // ✅ FIX: Corrected the type of mockRestaurants.
  // It is now initialized using the map function, resolving the List<dynamic> error.
  late final List<Restaurant> mockRestaurants = rawMockRestaurants.map((data) => Restaurant(
    name: data['name'] as String,
    category: data['category'] as String,
    rating: data['rating'] as double,
    reviewCount: data['reviewCount'] as String,
    deliveryTime: data['deliveryTime'] as String,
    distance: data['distance'] as String,
    imageUrl: data['imageUrl'] as String,
    itemPrice: data['itemPrice'] as String,
    isFeatured: data['isFeatured'] as bool,
    // ✅ FIX: This assumes the 'categoryTag' parameter has been added to the Restaurant model constructor.
    categoryTag: data['categoryTag'] as String,
  )).toList();


  @override
  Widget build(BuildContext context) {
    // 1. Get the controller instance
    final HomeController controller = Get.find<HomeController>();

    // 2. Wrap filtering logic in Obx to rebuild when category changes
    return Obx(() {
      // ✅ FIX: currentCategoryName is now available in HomeController
      final selectedCategory = controller.currentCategoryName;

      // 3. Filter the list based on the selected category
      final filteredRestaurants = mockRestaurants.where((shop) {
        if (selectedCategory == 'All') {
          return true; // Show all for 'All' category
        }
        // ✅ FIX: categoryTag is now available on the Restaurant object
        return shop.categoryTag == selectedCategory;
      }).toList();

      // Handle case where no shops match the filter
      if (filteredRestaurants.isEmpty) {
        return Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: Text(
              '🚫 No shops found for the "$selectedCategory" category.',
              style: GoogleFonts.poppins(fontSize: 14, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
          ),
        );
      }

      // 4. Build the list using the filtered data
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: filteredRestaurants.map((shop) {
          // RestaurantListItem is assumed to be defined elsewhere and accepts a Restaurant model
          return RestaurantListItem(restaurant: shop);
        }).toList(),
      );
    });
  }
}