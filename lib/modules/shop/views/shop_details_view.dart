import 'package:fastery/core/widgets/custom_app_bar.dart';
import 'package:fastery/modules/cart/views/widgets/mini_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// Ensure these imports point to the correct files in your project structure
import '../../../../core/constants/app_colors.dart';
import '../../dashboard/controllers/home_controller.dart';
import '../../dashboard/models/dashboard_section_model.dart';
import '../../dashboard/view/widgets/grid_category_section.dart';
import '../../dashboard/view/widgets/home_category_grid_widget.dart';
import '../../dashboard/view/widgets/horizontal_product_list.dart';
import '../../dashboard/view/widgets/restaurnet_list_view_content.dart';

class ShopDetailsView extends GetView<HomeController> {
  const ShopDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(title: "Shop Details"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 2. Hot Deals Section
            HorizontalProductList(
              title: controller.dashboardSections.firstWhereOrNull((s) => s.title == 'Hot Deals')?.title ?? 'Hot Deals',
              items: controller.dashboardSections.firstWhereOrNull((s) => s.title == 'Hot Deals')?.products ?? mockHotDeals,
            ),
        
            // 3. Grocery & Kitchen Section
            GridCategorySection(
              title: controller.dashboardSections.firstWhereOrNull((s) => s.title == 'Grocery & Kitchen')?.title ?? 'Grocery & Kitchen',
              categories: controller.dashboardSections.firstWhereOrNull((s) => s.title == 'Grocery & Kitchen')?.products ?? mockGroceryCategories,
            ),
        
            // 4. Snacks & Drinks Section
            GridCategorySection(
              title: controller.dashboardSections.firstWhereOrNull((s) => s.title == 'Snacks & Drinks')?.title ?? 'Snacks & Drinks',
              categories: controller.dashboardSections.firstWhereOrNull((s) => s.title == 'Snacks & Drinks')?.products ?? mockGroceryCategories.reversed.toList(),
            ),
        
            // 5. Beauty & Wellness Section
            GridCategorySection(
              title: controller.dashboardSections.firstWhereOrNull((s) => s.title == 'Beauty & Wellness')?.title ?? 'Beauty & Wellness',
              categories: controller.dashboardSections.firstWhereOrNull((s) => s.title == 'Beauty & Wellness')?.products ?? mockGroceryCategories,
            ),
        
            // Reduced padding since the bottom nav is now managed by the parent Scaffold
            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: MiniCartBottomBar(),
    );
  }
}