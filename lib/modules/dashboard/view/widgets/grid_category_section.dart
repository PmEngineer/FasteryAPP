import 'package:fastery/modules/category_items/views/category_items_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constants/app_colors.dart';
import '../../models/dashboard_section_model.dart';

class GridCategorySection extends StatelessWidget {
  final String title;
  final List<ProductItem> categories;

  const GridCategorySection({
    super.key,
    required this.title,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
              left: 24.0, right: 24.0, top: 16, bottom: 0),
          child: Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.textDark,
            ),
          ),
        ),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: GridView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: categories.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.85,
              crossAxisSpacing: 10,
              mainAxisSpacing: 15,
            ),
            itemBuilder: (context, index) {
              final item = categories[index];
              return Column(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap : (){
                        Get.to(
                              () => CategoryItemView(title: item.title),
                          // ✅ Apply the right-to-left transition here:
                          transition: Transition.rightToLeft,
                          // Optional: Set a smooth duration
                          duration: const Duration(milliseconds: 300),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.lightGrey.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppColors.lightGrey),
                        ),
                        child: Center(
                          child: Image.network(
                            item.imageUrl,
                            height: 60,
                            errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.shopping_bag_outlined,
                                size: 40, color: AppColors.textGrey),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.title,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(fontSize: 12),
                  ),
                ],
              );
            },
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}