import 'package:flutter/material.dart';
import '../../../../data/models/restaurnent_model.dart';
import 'restaurent_list_screen.dart'; // Your model import

class RestaurantListViewContent extends StatelessWidget {
  RestaurantListViewContent({super.key});

  // 💡 NOTE: The list now contains data for retail shops, conceptually reusing the 'Restaurant' model structure.
  final List<Restaurant> mockRestaurants = [
    Restaurant(
      name: 'SuperMart Groceries',
      category: 'Grocery, Daily Essentials, Fruits & Veg',
      rating: 4.6,
      reviewCount: '5.1K+',
      deliveryTime: '15-20 mins',
      distance: '0.8 km',
      imageUrl: 'https://plus.unsplash.com/premium_photo-1664202219877-b32fcd5aa731?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8c3VwZXIlMjBtYXJ0fGVufDB8fDB8fHww',
      itemPrice: 'AT ₹10', // Min order amount or special deal price
      isFeatured: true, // Best in Groceries
    ),
    Restaurant(
      name: 'Apollo Pharmacy',
      category: 'Medicines, Healthcare, Wellness',
      rating: 4.8,
      reviewCount: '10K+',
      deliveryTime: '20-25 mins',
      distance: '1.5 km',
      imageUrl: 'https://content.jdmagicbox.com/v2/comp/hyderabad/w2/040pxx40.xx40.181225105407.b7w2/catalogue/apollo-pharmacy-miyapur-hyderabad-chemists-ernkmwhl2p.jpg', // Placeholder for a pharmacy image
      itemPrice: 'AT ₹20',
      isFeatured: false,
    ),
    Restaurant(
      name: 'Gadget Hub Electronics',
      category: 'Electronics, Mobiles, Accessories',
      rating: 4.2,
      reviewCount: '1.2K+',
      deliveryTime: '45-60 mins',
      distance: '3.5 km',
      imageUrl: 'https://images.unsplash.com/photo-1565211604822-2641d0b081a6?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8ZWxlY3Ryb25pY3MlMjBzaG9wfGVufDB8fDB8fHww', // Placeholder for an electronics shop
      itemPrice: 'AT ₹54',
    ),
    Restaurant(
      name: 'Bookworm Nook',
      category: 'Books, Stationery, Art Supplies',
      rating: 4.7,
      reviewCount: '800+',
      deliveryTime: '30-40 mins',
      distance: '2.1 km',
      imageUrl: 'https://images.unsplash.com/photo-1640313172461-84c0081c27dd?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fHN0YXRpb25hcnklMjBzaG9wfGVufDB8fDB8fHww', // Placeholder for a bookstore image
      itemPrice: 'AT ₹20',
      isFeatured: true, // Best in Books/Stationery
    ),
    Restaurant(
      name: 'Fresh Paneer & Sweets',
      category: 'Dairy & Sweets',
      rating: 4.5,
      reviewCount: '3.4K+',
      deliveryTime: '20-30 mins',
      distance: '1.0 km',
      imageUrl: 'https://images.unsplash.com/photo-1760776140488-32fcfab4066a?q=80&w=870&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', // Placeholder for a butcher/meat shop
      itemPrice: 'AT ₹15',
    ),
    Restaurant(
      name: 'Pet Planet Supplies',
      category: 'Pet Food, Toys, Grooming',
      rating: 4.3,
      reviewCount: '1.9K+',
      deliveryTime: '30-35 mins',
      distance: '2.8 km',
      imageUrl: 'https://images.unsplash.com/photo-1569267034662-77399a614620?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cGV0JTIwc2hvcHxlbnwwfHwwfHx8MA%3D%3D', // Placeholder for a pet store
      itemPrice: 'AT ₹22',
      isFeatured: false,
    ),
    Restaurant(
      name: 'Fashion Fiesta Boutique',
      category: 'Apparel, Accessories, Footwear',
      rating: 4.0,
      reviewCount: '4.9K+',
      deliveryTime: '1-2 Days',
      distance: '5.0 km',
      imageUrl: 'https://images.unsplash.com/photo-1555529771-835f59fc5efe?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fGdhcm1lbnRzJTIwc2hvcCUyMHNob3B8ZW58MHx8MHx8fDA%3D', // Placeholder for a clothing store
      itemPrice: 'AT ₹10',
      isFeatured: true, // Top Fashion Store
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: mockRestaurants.map((shop) {
        return RestaurantListItem(restaurant: shop);
      }).toList(),
    );
  }
}