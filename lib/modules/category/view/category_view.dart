import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constants/app_colors.dart';
import '../../../data/models/category_model.dart';
import '../controllers/category_controller.dart';

class CategoryView extends GetView<CategoryController> {
  const CategoryView({super.key});

  Widget _buildCategoryItem(CategoryModel category, BuildContext context) {
    return GestureDetector(
      onTap: () => controller.onCategoryTap(category),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Placehold er for image/icon - use a simple NetworkImage for a placeholder
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                category.iconUrl,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const Icon(
                  Icons.image,
                  size: 60,
                  color: AppColors.textGrey,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              category.title,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColors.kDarkText,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper widget for the section title
  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
      child: Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppColors.kDarkText,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // You must ensure CategoryController is initialized via binding before this view is built.
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          'Categories',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.kDarkText,
          ),
        ),
        centerTitle: false,
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: Icon(Icons.arrow_back_ios,size: 20, color: AppColors.kDarkText),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: AppColors.kDarkText),
            onPressed: () {
              Get.snackbar('Search', 'Search action tapped');
            },
          ),
        ],
      ),
      body: Obx(
            () {
          // Splitting the mock data into two sections for demonstration purposes
          final mainCategories = controller.categories.take(12).toList();
          final snacksDrinks = controller.categories.skip(12).take(2).toList();

          return ListView(
            padding: EdgeInsets.zero,
            children: [
              // 1. Grocery & Kitchen Section
              _buildSectionHeader('Grocery & Kitchen'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(), // Important for nested scrolling
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.5, // Adjust as needed
                  ),
                  itemCount: mainCategories.length,
                  itemBuilder: (context, index) {
                    return _buildCategoryItem(mainCategories[index], context);
                  },
                ),
              ),
              const SizedBox(height: 10),

              // 2. Snacks & Drinks Section (Based on image scroll position)
              _buildSectionHeader('Snacks & drinks'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.5,
                  ),
                  itemCount: snacksDrinks.length,
                  itemBuilder: (context, index) {
                    return _buildCategoryItem(snacksDrinks[index], context);
                  },
                ),
              ),
              // Add padding for the bottom navigation bar
              const SizedBox(height: 90),
            ],
          );
        },
      ),
    );
  }
}