// all_items_controller.dart

import 'package:get/get.dart';

// --- Data Model ---
class ItemModel {
  final String title;
  final String description;
  final String imagePath;
  final String weight;
  final double rating;
  final int reviews;
  final double currentPrice;
  final double originalPrice;
  final double discount;
  final int deliveryTime;
  final bool isBestseller;

  ItemModel({
    required this.title,
    required this.description,
    required this.imagePath,
    required this.weight,
    required this.rating,
    required this.reviews,
    required this.currentPrice,
    required this.originalPrice,
    required this.discount,
    required this.deliveryTime,
    this.isBestseller = false,
  });
}

// --- Controller ---
class AllItemsController extends GetxController {
  // Use RxList to make the list observable for future updates (if any)
  final RxList<ItemModel> hotDeals = <ItemModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Load mock data similar to the screenshot
    loadHotDeals();
  }

  void loadHotDeals() {
    hotDeals.addAll([
      ItemModel(
        title: 'Bingo Tedhe Medhe Masala Tadka',
        description: 'Irregular masala snack sticks',
        imagePath: 'assets/bingo_tedhe_medhe.png', // Replace with actual path
        weight: '75 g',
        rating: 4.5,
        reviews: 679,
        currentPrice: 13,
        originalPrice: 20,
        discount: 0.35, // 35% OFF
        deliveryTime: 8,
        isBestseller: true,
      ),
      ItemModel(
        title: 'Cadbury Oreo Vanilla Flavour Crème Sandwich Biscuit',
        description: 'Perfect snack with a sweet vanilla twist.',
        imagePath: 'assets/oreo.png', // Replace with actual path
        weight: '41.75 g',
        rating: 4.5,
        reviews: 70,
        currentPrice: 8,
        originalPrice: 10,
        discount: 0.20, // 20% OFF
        deliveryTime: 8,
        isBestseller: true,
      ),
      ItemModel(
        title: 'Bingo! Mad Angles Achaari Masti',
        description: 'Tangy and spicy potato chips',
        imagePath: 'assets/bingo_mad_angles.png', // Replace with actual path
        weight: '90 g',
        rating: 4.4,
        reviews: 501,
        currentPrice: 20,
        originalPrice: 25,
        discount: 0.20,
        deliveryTime: 10,
        isBestseller: true,
      ),
      ItemModel(
        title: "Sunfeast Mom's Magic Cashew & Almond",
        description: 'Crunchy cookies with nuts',
        imagePath: 'assets/moms_magic.png', // Replace with actual path
        weight: '70 g',
        rating: 4.6,
        reviews: 450,
        currentPrice: 15,
        originalPrice: 18,
        discount: 0.166,
        deliveryTime: 12,
        isBestseller: true,
      ),
    ]);
  }
}