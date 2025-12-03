import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constants/app_colors.dart';
import '../../controllers/home_controller.dart';
import '../../models/dashboard_section_model.dart';
import '../widgets/home_category_grid_widget.dart';
import '../widgets/horizontal_product_list.dart';
import '../widgets/grid_category_section.dart';
import '../widgets/bottom_nav_item.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Obx(
                () => CustomScrollView(
              slivers: [
                // --- 1. SLIVER APP BAR ---
                SliverAppBar(
                  expandedHeight: 150.0,
                  floating: false,
                  pinned: true,
                  backgroundColor: AppColors.primaryRed,
                  elevation: 0,
                  automaticallyImplyLeading: false,
                  flexibleSpace: FlexibleSpaceBar(
                    titlePadding: EdgeInsets.zero,
                    centerTitle: false,
                    background: Padding(
                      padding: const EdgeInsets.only(top: 40, bottom: 40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Top Location Bar
                          GestureDetector(
                            onTap: controller.onLocationTapped,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 24.0),
                              child: Row(
                                children: [
                                  const Icon(Icons.access_time, color: Colors.white, size: 16),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      controller.locationText.value,
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  const Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 24),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          // Search Bar
                          GestureDetector(
                            onTap: controller.onSearchTapped,
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 24.0),
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                              decoration: BoxDecoration(
                                color: AppColors.background,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: [
                                  const Icon(Icons.search, color: AppColors.textGrey),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Text(
                                      'Search for Atta, Tshirts...',
                                      style: GoogleFonts.poppins(color: AppColors.textGrey),
                                    ),
                                  ),
                                  const Icon(Icons.mic_none, color: AppColors.textGrey),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // --- 2. SLIVER LIST (Main Content) ---
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      // 1. Horizontal Category Grid
                      const HomeCategoryGrid(),

                      // 2. Hot Deals Section (using the new widget)
                      HorizontalProductList(
                        title: controller.dashboardSections.firstWhereOrNull((s) => s.title == 'Hot Deals')?.title ?? 'Hot Deals',
                        items: controller.dashboardSections.firstWhereOrNull((s) => s.title == 'Hot Deals')?.products ?? mockHotDeals,
                      ),

                      // 3. Grocery & Kitchen Section (using the new widget)
                      GridCategorySection(
                        title: controller.dashboardSections.firstWhereOrNull((s) => s.title == 'Grocery & Kitchen')?.title ?? 'Grocery & Kitchen',
                        categories: controller.dashboardSections.firstWhereOrNull((s) => s.title == 'Grocery & Kitchen')?.products ?? mockGroceryCategories,
                      ),

                      // 4. Snacks & Drinks Section (using the new widget)
                      GridCategorySection(
                        title: controller.dashboardSections.firstWhereOrNull((s) => s.title == 'Snacks & Drinks')?.title ?? 'Snacks & Drinks',
                        categories: controller.dashboardSections.firstWhereOrNull((s) => s.title == 'Snacks & Drinks')?.products ?? mockGroceryCategories.reversed.toList(),
                      ),

                      // 5. Beauty & Wellness Section (using the new widget)
                      GridCategorySection(
                        title: controller.dashboardSections.firstWhereOrNull((s) => s.title == 'Beauty & Wellness')?.title ?? 'Beauty & Wellness',
                        categories: controller.dashboardSections.firstWhereOrNull((s) => s.title == 'Beauty & Wellness')?.products ?? mockGroceryCategories,
                      ),

                      const SizedBox(height: 100),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // --- 3. Floating Bottom Navigation Bar ---
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                color: AppColors.background,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    spreadRadius: 2,
                    offset: const Offset(0, -2),
                  ),
                ],
                borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BottomNavItem(Icons.home, 'Home', isActive: true, onTap: (){}),
                  BottomNavItem(Icons.category, 'Instamart', onTap: (){}),
                  BottomNavItem(Icons.shopping_basket, 'Categories', onTap: (){}),
                  BottomNavItem(Icons.person, 'Account', onTap: (){}),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}