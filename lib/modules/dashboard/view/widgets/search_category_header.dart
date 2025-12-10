
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/app_colors.dart';
import '../../controllers/home_controller.dart';

class SearchCategoryHeader extends SliverPersistentHeaderDelegate {
  final HomeController controller;

  SearchCategoryHeader(this.controller);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    double topMargin = (shrinkOffset > 0) ? 20.0 : 0.0;
    return Container(
      color: controller.headerBackgroundColor,
      padding: const EdgeInsets.only(bottom: 5),
      child: Column(
        children: [
          // ----------------- SEARCH BAR -----------------
          GestureDetector(
            onTap: controller.onSearchTapped,
            child: Container(
              margin: EdgeInsets.only(
                left: 24,
                right: 24,
                top: topMargin, // <-- This now dictates the padding after scrolling
                bottom: 12,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const Icon(Icons.search, color: AppColors.textGrey, size: 20),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      controller.selectedCategoryIndex.value == 1
                          ? 'Search for Moisturiser'
                          : 'Search for Atta, Tshirts...',
                      style: GoogleFonts.poppins(
                        color: AppColors.textGrey,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const Icon(Icons.mic_none, color: AppColors.textGrey, size: 20),
                ],
              ),
            ),
          ),

          // ----------------- CATEGORY ROW -----------------
          SizedBox(
            height: 55,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: controller.categories.length,
              itemBuilder: (context, index) {
                final category = controller.categories[index];
                final isSelected =
                    controller.selectedCategoryIndex.value == index;

                return GestureDetector(
                  onTap: () => controller.selectCategory(index),
                  child: Container(
                    margin: const EdgeInsets.only(right: 8),
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? Colors.white.withOpacity(0.15)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.15),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            category['icon'],
                            color: AppColors.background,
                            size: 15,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          category['name'],
                          style: GoogleFonts.poppins(
                            color: AppColors.background,
                            fontSize: 8,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  // Keep maxExtent at 130.0 for the unscrolled height
  double get maxExtent => 135.0;

  @override
  // Keep minExtent at 130.0 for the pinned height
  double get minExtent => 135.0;

  @override
  bool shouldRebuild(SearchCategoryHeader oldDelegate) => true;
}