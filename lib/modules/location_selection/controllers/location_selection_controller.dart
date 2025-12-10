import 'package:get/get.dart';
import 'package:flutter/material.dart'; // Needed for Icons

// Mock Data Model
class AddressModel {
  final String title;
  final String address;
  final String distance;
  final bool isSelected;
  final IconData icon;

  AddressModel({
    required this.title,
    required this.address,
    required this.distance,
    this.isSelected = false,
    required this.icon,
  });
}

class LocationSelectionController extends GetxController {
  // Observable state to hold the list of saved addresses
  final savedAddresses = <AddressModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Load mock data
    _loadMockAddresses();
  }

  void _loadMockAddresses() {
    savedAddresses.assignAll([
      AddressModel(
        title: 'Rent',
        address: '495, Lda Colony, Hindupur, Sector C1, Lda Colony, Lucknow...',
        distance: '1.6 km',
        isSelected: true,
        icon: Icons.send_rounded,
      ),
      AddressModel(
        title: 'Ankit',
        address: 'Abhyaas Hostel Pg, Badi, Krishna Nagar, Alambagh, Lucknow...',
        distance: '852 m',
        icon: Icons.send_rounded,
      ),
      AddressModel(
        title: 'Ankit Khare',
        address: '121, P Block, Navin Nagar, Kakadeo, Kanpur, Uttar Pradesh, ...',
        distance: '70.6 km',
        icon: Icons.send_rounded,
      ),
    ]);
  }

  // State for the currently selected address's index
  final selectedIndex = 0.obs;

  // Actions for the header cards
  void useCurrentLocation() {
    Get.snackbar('Action', 'Using current location...');
  }

  void addNewAddress() {
    Get.snackbar('Action', 'Navigating to Add New Address...');
  }

  void requestAddress() {
    Get.snackbar('Action', 'Requesting Address via WhatsApp...');
  }

  // Actions for the saved address list
  void selectAddress(int index) {
    selectedIndex.value = index;
    // Note: If the actual AddressModel needs updating, you would update the list here
    Get.snackbar('Selected', 'Address selected: ${savedAddresses[index].title}');
  }

  void editAddress(AddressModel address) {
    Get.snackbar('Action', 'Editing ${address.title}');
  }

  void shareAddress(AddressModel address) {
    Get.snackbar('Action', 'Sharing ${address.title}');
  }

  void deleteAddress(AddressModel address) {
    savedAddresses.remove(address);
    Get.snackbar('Action', '${address.title} Deleted');
  }

  void viewAllAddresses() {
    Get.snackbar('Action', 'Showing all saved addresses');
  }
}