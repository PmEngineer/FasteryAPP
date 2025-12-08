import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constants/app_colors.dart';

class SidebarItem extends StatelessWidget {
  final String label;
  final String imageUrl;
  final bool isSelected;

  const SidebarItem({
    super.key,
    required this.label,
    required this.imageUrl,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      color: isSelected ? Colors.white : AppColors.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(imageUrl, height: 40), // Use placeholder/network for now
          const SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: AppColors.textDark,
            ),
          ),
        ],
      ),
    );
  }
}

class CategorySidebar extends StatelessWidget {
  const CategorySidebar({super.key});

  final List<Map<String, String>> categories = const [
    {'label': 'Fresh Vegetables', 'icon': 'assets/veg.png'}, // Selected
    {'label': 'Leafy and Seasonings', 'icon': 'assets/leafy.png'},
    {'label': 'Pooja & Festive', 'icon': 'assets/pooja.png'},
    {'label': 'Exotic Vegetables', 'icon': 'assets/exotic.png'},
    {'label': 'Fresh Fruits', 'icon': 'assets/fruit.png'},
    {'label': 'Cuts & Sprouts', 'icon': 'assets/sprouts.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      color: AppColors.background, // Light background for the sidebar
      child: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          // Using a placeholder image for demo
          String placeholderUrl = index == 0
              ? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHZqj-XReJ2R76nji51cZl4ETk6-eHRmZBRw&s'
              : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHZqj-XReJ2R76nji51cZl4ETk6-eHRmZBRw&s';

          return SidebarItem(
            label: categories[index]['label']!,
            imageUrl: placeholderUrl,
            isSelected: index == 0, // Mocking 'Fresh Vegetables' as selected
          );
        },
      ),
    );
  }
}