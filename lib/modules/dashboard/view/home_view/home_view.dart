import 'package:fastery/modules/cart/views/widgets/mini_bottom_bar.dart';
import 'package:fastery/modules/profile/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// Ensure these imports point to the correct files in your project structure
import '../../../../core/constants/app_colors.dart';
import '../../../../core/routes/app_routes.dart';
import '../../controllers/home_controller.dart';
import '../../models/dashboard_section_model.dart'; // Contains mock data structure
import '../widgets/home_category_grid_widget.dart';
import '../widgets/horizontal_product_list.dart';
import '../widgets/grid_category_section.dart';
import '../widgets/restaurent_list_screen.dart';
import '../widgets/restaurnet_list_view_content.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // The HomeView no longer needs the Stack/Positioned widget to manage the
    // bottom bar, as the parent Scaffold (MainWrapper) now manages it via
    // bottomNavigationBar property.
    return Scaffold(
      backgroundColor: AppColors.background,
      // The body contains only the scrollable content
      body: Obx(
            () => CustomScrollView(
          slivers: [
            // --- 1. SLIVER APP BAR (Header) ---
            SliverAppBar(
              expandedHeight: 100.0,
              floating: false,
              pinned: true,
              backgroundColor: AppColors.primaryRed,
              elevation: 0,
              automaticallyImplyLeading: false,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.zero,
                centerTitle: false,
                background: Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
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
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 10),
                              SizedBox(width: 20,),
                              GestureDetector(
                                onTap: (){
                                  Get.toNamed(Routes.PROFILE);
                                },
                                  child: const Icon(Icons.person_outline, color: AppColors.background, size: 20,))
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
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: AppColors.background,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.search, color: AppColors.textGrey, size: 20,),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  'Search for Atta, Tshirts...',
                                  style: GoogleFonts.poppins(color: AppColors.textGrey, fontSize: 12),
                                ),
                              ),
                              const Icon(Icons.mic_none, color: AppColors.textGrey, size: 20,),
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),

            // --- 2. SLIVER LIST (Main Content Sections) ---
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: EdgeInsets.only(left: 16.0, top: 10.0, bottom: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Top 153 shops to explore',
                          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          'Featured Shops',
                          style: GoogleFonts.poppins(fontSize: 16, color: Colors.black54),
                        ),
                      ],
                    ),
                  ),

                  // 3. The Restaurant List Items
                  RestaurantListViewContent(),

                  // // 2. Hot Deals Section
                  // HorizontalProductList(
                  //   title: controller.dashboardSections.firstWhereOrNull((s) => s.title == 'Hot Deals')?.title ?? 'Hot Deals',
                  //   items: controller.dashboardSections.firstWhereOrNull((s) => s.title == 'Hot Deals')?.products ?? mockHotDeals,
                  // ),
                  //
                  // // 3. Grocery & Kitchen Section
                  // GridCategorySection(
                  //   title: controller.dashboardSections.firstWhereOrNull((s) => s.title == 'Grocery & Kitchen')?.title ?? 'Grocery & Kitchen',
                  //   categories: controller.dashboardSections.firstWhereOrNull((s) => s.title == 'Grocery & Kitchen')?.products ?? mockGroceryCategories,
                  // ),
                  //
                  // // 4. Snacks & Drinks Section
                  // GridCategorySection(
                  //   title: controller.dashboardSections.firstWhereOrNull((s) => s.title == 'Snacks & Drinks')?.title ?? 'Snacks & Drinks',
                  //   categories: controller.dashboardSections.firstWhereOrNull((s) => s.title == 'Snacks & Drinks')?.products ?? mockGroceryCategories.reversed.toList(),
                  // ),
                  //
                  // // 5. Beauty & Wellness Section
                  // GridCategorySection(
                  //   title: controller.dashboardSections.firstWhereOrNull((s) => s.title == 'Beauty & Wellness')?.title ?? 'Beauty & Wellness',
                  //   categories: controller.dashboardSections.firstWhereOrNull((s) => s.title == 'Beauty & Wellness')?.products ?? mockGroceryCategories,
                  // ),

                  // Reduced padding since the bottom nav is now managed by the parent Scaffold
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: MiniCartBottomBar(),
    );
  }
}