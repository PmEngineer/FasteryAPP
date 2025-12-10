import 'package:fastery/core/constants/app_colors.dart';
import 'package:flutter/material.dart'; // Import for the Color type
import 'package:get/get.dart';
import '../../../core/helpers/location_helper.dart';
import '../../../data/services/address_service.dart';
import '../models/dashboard_section_model.dart';


class HomeController extends GetxController {
  final dashboardSections = <DashboardSection>[].obs;

  final locationText = 'Fetching location...'.obs;
  final extraHeaderHeight = 0.0.obs;

  // --- New State Variables ---
  final selectedCategoryIndex = 0.obs;

  final List<Map<String, dynamic>> categories = const [
    {'name': 'All', 'color': AppColors.primaryRed, 'icon': Icons.grid_view},      // Primary Red (Placeholder)
    {'name': 'Winter', 'color': Color(0xFF42A5F5), 'icon': Icons.ac_unit},    // Primary Blue (Placeholder)
    {'name': 'Wedding', 'color': Color(0xFFE53935), 'icon': Icons.diamond},   // Primary Red (Placeholder)
    {'name': 'Fresh', 'color': Color(0xFF66BB6A), 'icon': Icons.local_florist}, // Primary Green (Placeholder)
    {'name': 'Maxover', 'color': Color(0xFFAB47BC), 'icon': Icons.all_inclusive}, // Primary Purple (Placeholder)
    {'name': 'Electronics', 'color': Color(0xFFf1c40f), 'icon': Icons.headphones},
  ];

  // ✅ FIX: Added the missing currentCategoryName getter
  String get currentCategoryName {
    if (selectedCategoryIndex.value >= 0 && selectedCategoryIndex.value < categories.length) {
      return categories[selectedCategoryIndex.value]['name'] as String;
    }
    return 'All'; // Default fallback name
  }

  // Getter for Dynamic Background Color
  Color get headerBackgroundColor {
    if (selectedCategoryIndex.value >= 0 && selectedCategoryIndex.value < categories.length) {
      // Safely retrieve color, falling back to a default if cast fails
      return categories[selectedCategoryIndex.value]['color'] as Color? ?? Color(0xFFE53935);
    }
    return Color(0xFFE53935); // Default color (Primary Red)
  }

  void selectCategory(int index) {
    selectedCategoryIndex.value = index;
    // You can add logic here to fetch new data based on the selected category
    print("Selected category: ${categories[index]['name']}");
  }
  // ------------------------------------

  final AddressService addressService = AddressService();

  @override
  void onInit() {
    super.onInit();
    fetchDashboardData();
    fetchUserLocationAddress();
  }

  void fetchDashboardData() async {
    await Future.delayed(const Duration(milliseconds: 300));
    // NOTE: 'mockSections' is assumed to be available in this scope.
    // Error will occur if 'mockSections' is not imported or defined.
    dashboardSections.assignAll(mockSections);
  }

  void fetchUserLocationAddress() async {
    final position = await LocationHelper.getCurrentLocation();

    if (position == null) {
      locationText.value = "Location permission denied";
      return;
    }

    double lat = position.latitude;
    double lng = position.longitude;

    print("Current Latitude: $lat");
    print("Current Longitude: $lng");

    final result = await addressService.fetchAddress(lat: lat, lng: lng);

    if (result != null) {
      locationText.value = result.address;
    } else {
      locationText.value = "Location not found";
    }
  }

  void onSearchTapped() {
    print("Search Tapped");
  }

  void onLocationTapped() {
    fetchUserLocationAddress(); // refresh manually
  }
}