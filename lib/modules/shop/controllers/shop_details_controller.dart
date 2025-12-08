// In: lib/modules/shop_details/controllers/shop_details_controller.dart

import 'package:get/get.dart';
// Import your data models from the previous context
import 'package:flutter/material.dart'; // Used for mock data helper functions

// Re-using the provided models and mock data for demonstration
class ProductItem {
  // ... (Your ProductItem class definition)
  final String title;
  final String description;
  final String weight;
  final String price;
  final String originalPrice;
  final String discount;
  final String imageUrl;
  final bool isBestseller;
  final bool isCategory;

  ProductItem({
    required this.title,
    this.description = '',
    this.weight = '',
    required this.price,
    this.originalPrice = '',
    this.discount = '',
    this.imageUrl = 'https://placehold.co/150x100/eeeeee/333333?text=Product',
    this.isBestseller = false,
    this.isCategory = false,
  });
}

class DashboardSection {
  final String title;
  final List<ProductItem> products;

  DashboardSection(this.title, this.products);
}

// --- Mock Data (Re-copied for controller context) ---
final List<ProductItem> mockHotDeals = [
  ProductItem(title: 'Bingo Mad Angles', price: '18', originalPrice: '20', discount: '10% OFF', weight: '60 g', imageUrl: 'https://placehold.co/150x100/eeeeee/333333?text=Deal1', isBestseller: true),
  ProductItem(title: 'Cadbury Oreo', price: '8', originalPrice: '10', discount: '20% OFF', weight: '40 g', imageUrl: 'https://placehold.co/150x100/eeeeee/333333?text=Deal2', isBestseller: true),
];

final List<ProductItem> mockGroceryCategories = [
  ProductItem(title: 'Fresh Vegetables', price: '', isCategory: true, imageUrl: 'https://placehold.co/100x100/7CFC00/000000?text=Veg'),
  ProductItem(title: 'Fresh Fruits', price: '', isCategory: true, imageUrl: 'https://placehold.co/100x100/FFD700/000000?text=Fruit'),
];

final List<DashboardSection> mockSections = [
  DashboardSection('Hot Deals', mockHotDeals),
  DashboardSection('Grocery & Kitchen', mockGroceryCategories),
  DashboardSection('Snacks & Drinks', mockGroceryCategories.reversed.toList()),
  DashboardSection('Beauty & Wellness', mockGroceryCategories),
];

class ShopDetailsController extends GetxController {
  // Observable list to hold the shop's product sections
  final dashboardSections = <DashboardSection>[].obs;

  // Example of passing data to the view (e.g., Shop Name)
  final shopName = 'The Grand Grocery Store'.obs;
  final shopRating = '4.5 (5K+)'.obs;
  final shopDeliveryTime = '15-20 min'.obs;
  final shopImage = 'https://placehold.co/600x400/87CEEB/FFFFFF?text=Shop+Banner'.obs;


  @override
  void onInit() {
    super.onInit();
    // Simulate loading data
    dashboardSections.value = mockSections;
  }

  // Helper to fetch sections based on title (used in the view)
  DashboardSection? getSection(String title) {
    return dashboardSections.firstWhereOrNull((s) => s.title == title);
  }
}