import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constants/app_colors.dart';

class CategoryItem {
  final String title;
  final IconData icon;
  final Color? iconColor;

  CategoryItem(this.title, this.icon, {this.iconColor});
}

final List<CategoryItem> sampleCategories = [
  CategoryItem('Biscuits and Cakes', Icons.cookie, iconColor: Colors.brown.shade400),
  CategoryItem('Winter', Icons.ac_unit, iconColor: Colors.blue.shade300),
  CategoryItem('Wedding', Icons.favorite, iconColor: AppColors.primaryRed),
  CategoryItem('Fresh', Icons.local_florist, iconColor: Colors.green.shade500),
  CategoryItem('Electronics', Icons.devices_other, iconColor: Colors.grey.shade700),
  CategoryItem('Meat and Seafood', Icons.set_meal, iconColor: Colors.orange.shade800),
  CategoryItem('Milk Drinks', Icons.local_drink, iconColor: Colors.blue.shade700),
];

class HomeCategoryGrid extends StatelessWidget {
  const HomeCategoryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: sampleCategories.length,
        itemBuilder: (context, index) {
          final item = sampleCategories[index];
          return Padding(
            padding: EdgeInsets.only(left: index == 0 ? 24 : 8, right: 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: item.iconColor?.withOpacity(0.15) ?? AppColors.primaryPurple.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    item.icon,
                    color: item.iconColor ?? AppColors.primaryPurple,
                    size: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item.title.split(' ')[0],
                  style: GoogleFonts.poppins(
                    fontSize: 8,
                    color: AppColors.textDark,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
