import 'package:fastery/core/constants/app_colors.dart';
import 'package:fastery/core/widgets/custom_app_bar.dart';
import 'package:fastery/modules/location_selection/views/widgets/location_picker_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/location_selection_controller.dart';

class LocationSelectionView extends GetView<LocationSelectionController> {
  const LocationSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(title: 'Select Your Location',),
      body: Column(
        children: [
          // Search Bar
          _buildSearchBar(),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Action Cards (Use Current, Add New, Request)
                  _buildActionCards(context),

                  const SizedBox(height: 24),

                  // Saved Addresses Header
                  const Text(
                    'SAVED ADDRESSES',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                      letterSpacing: 0.8,
                    ),
                  ),

                  const SizedBox(height: 12),

                  // List of Saved Addresses
                  _buildSavedAddressesList(),

                  const SizedBox(height: 16),

                  // View All Button
                  _buildViewAllButton(),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Search an area or address',
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            prefixIcon: const Icon(Icons.search, color: Colors.grey),
            suffixIcon: IconButton(
              icon: const Icon(Icons.search, color: Colors.black),
              onPressed: () {},
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActionCards(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _ActionCard(
          icon: Icons.my_location,
          label: 'Use Current\nLocation',
          color: Colors.blue.shade600,
          onTap: (){
            Get.to(
                  () => LocationPickerScreen(),
              transition: Transition.rightToLeft,
              duration: const Duration(milliseconds: 300),
            );
          },
        ),
        _ActionCard(
          icon: Icons.add,
          label: 'Add New\nAddress',
          color: Colors.blue.shade600,
          onTap: (){},
        ),
        _ActionCard(
          icon: Icons.people,
          label: 'Request\nAddress',
          color: Colors.green.shade600,
          onTap: (){},
        ),
      ],
    );
  }

  Widget _buildSavedAddressesList() {
    return Obx(() {
      return Column(
        children: List.generate(
          controller.savedAddresses.length,
              (index) {
            final address = controller.savedAddresses[index];
            // Check if the current address is the one selected via index
            final isSelected = controller.selectedIndex.value == index;

            return SavedAddressItem(
              address: address,
              isSelected: isSelected,
              onTap: () => controller.selectAddress(index),
              onEdit: () => controller.editAddress(address),
              onShare: () => controller.shareAddress(address),
              onDelete: () => controller.deleteAddress(address),
            );
          },
        ),
      );
    });
  }

  Widget _buildViewAllButton() {
    return Center(
      child: TextButton(
        onPressed: controller.viewAllAddresses,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'View all',
              style: GoogleFonts.poppins(
                color: AppColors.primaryRed,
                fontWeight: FontWeight.w600,
              ),
            ),
            Icon(Icons.keyboard_arrow_down, color: AppColors.primaryRed,),
          ],
        ),
      ),
    );
  }
}

// --- Helper Widgets ---

class _ActionCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _ActionCard({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          color: AppColors.lightGrey,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Colors.grey.shade200),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: color, size: 20),
                const SizedBox(height: 8),
                Text(
                  label,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SavedAddressItem extends StatelessWidget {
  final AddressModel address;
  final bool isSelected;
  final VoidCallback onTap;
  final VoidCallback onEdit;
  final VoidCallback onShare;
  final VoidCallback onDelete;

  const SavedAddressItem({
    required this.address,
    required this.isSelected,
    required this.onTap,
    required this.onEdit,
    required this.onShare,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: AppColors.lightGrey,
        elevation: 0,
        margin: const EdgeInsets.only(bottom: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            color: isSelected ? Colors.red.shade400 : Colors.grey.shade200,
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left side: Distance and Icon
              Container(
                width: 70, // Fixed width for distance/icon column
                padding: const EdgeInsets.only(right: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      address.distance,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Icon(address.icon, size: 16, color: Colors.red),
                  ],
                ),
              ),

              const SizedBox(width: 8),

              // Middle: Title and Address
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          address.title,
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (isSelected)
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                              decoration: BoxDecoration(
                                  color: Colors.red.shade50,
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(color: Colors.red.shade400)
                              ),
                              child: Text(
                                'SELECTED',
                                style: GoogleFonts.poppins(
                                  color: Colors.red.shade400,
                                  fontSize: 8,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      address.address,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),

              // Right side: More menu
              PopupMenuButton<String>(
                color: AppColors.lightGrey,
                onSelected: (String result) {
                  if (result == 'Edit') {
                    onEdit();
                  } else if (result == 'Share') {
                    onShare();
                  } else if (result == 'Delete') {
                    onDelete();
                  }
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  PopupMenuItem<String>(
                    value: 'Edit',
                    child: Row(
                      children: [
                        Icon(Icons.edit, color: Colors.black),
                        SizedBox(width: 8),
                        Text('Edit', style: GoogleFonts.poppins(),),
                      ],
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: 'Share',
                    child: Row(
                      children: [
                        Icon(Icons.share, color: Colors.black),
                        SizedBox(width: 8),
                        Text('Share', style: GoogleFonts.poppins(),),
                      ],
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: 'Delete',
                    child: Row(
                      children: [
                        Icon(Icons.delete, color: Colors.black),
                        SizedBox(width: 8),
                        Text('Delete', style: GoogleFonts.poppins(),),
                      ],
                    ),
                  ),
                ],
                icon: const Icon(Icons.more_vert, color: Colors.grey),
                offset: const Offset(-20, 30), // Adjust offset to mimic screenshot pop-up position
              ),
            ],
          ),
        ),
      ),
    );
  }
}