import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart'; // Import Get for navigation
import '../../../../core/constants/app_colors.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../product/views/product_details_view.dart';
import '../../models/dashboard_section_model.dart';
import 'product_card.dart';

class HorizontalProductList extends StatelessWidget {
  final String title;
  final List<ProductItem> items;

  const HorizontalProductList({
    super.key,
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textDark,
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Get.toNamed(Routes.ALLITEMS);
                  },
                  child: Text(
                    'See All >',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: AppColors.primaryRed,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return ProductCard(
                  title: item.title,
                  weight: item.weight,
                  price: item.price,
                  originalPrice: item.originalPrice,
                  discount: item.discount,
                  imageUrl: item.imageUrl,
                  isBestseller: item.isBestseller,
                  description: '',
                  // --- 🎯 IMPLEMENT NAVIGATION HERE ---
                  onTap: () {
                    // Navigate to the details page, passing the tapped ProductItem
                    Get.to(() => ProductDetailsView(product: item));
                    // If not using GetX, use standard Flutter Navigator:
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => ProductDetailsView(product: item),
                    //   ),
                    // );
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}