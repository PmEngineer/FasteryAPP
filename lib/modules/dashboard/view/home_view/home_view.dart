import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/routes/app_routes.dart';
import '../../controllers/home_controller.dart';
import '../../models/dashboard_section_model.dart';
import '../widgets/home_category_grid_widget.dart';
import '../widgets/product_card.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  Widget _buildHorizontalProductList(String title, List<ProductItem> items) {
    return Column(
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
              Text(
                'See All >',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: AppColors.primaryRed,
                  fontWeight: FontWeight.w600,
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
                onTap: () {},
              );
            },
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _buildGridCategorySection(String title, List<ProductItem> categories) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 24.0,
            right: 24.0,
            top: 16,
            bottom: 0,
          ),
          child: Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.textDark,
            ),
          ),
        ),

        SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: GridView.builder(
            padding: EdgeInsets.zero,
            // ← IMPORTANT
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
                              const Icon(
                                Icons.shopping_bag_outlined,
                                size: 40,
                                color: AppColors.textGrey,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Obx(
            () => CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: 150.0,
                  floating: false,
                  pinned: true,
                  backgroundColor: AppColors.primaryRed,
                  elevation: 0,
                  automaticallyImplyLeading: false,
                  // We use a custom back button

                  // The flexible space defines the content that moves/collapses
                  flexibleSpace: FlexibleSpaceBar(
                    titlePadding: EdgeInsets.zero,
                    // title: Padding(
                    //   padding: const EdgeInsets.only(bottom: 50.0),
                    //   child: HomeCategoryGrid(), // This horizontal grid is visible when collapsed
                    // ),
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
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24.0,
                              ),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.access_time,
                                    color: Colors.white,
                                    size: 16,
                                  ),
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
                                  const Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          // Search Bar
                          GestureDetector(
                            onTap: controller.onSearchTapped,
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 24.0,
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.background,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.search,
                                    color: AppColors.textGrey,
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Text(
                                      'Search for Atta, Tshirts...',
                                      style: GoogleFonts.poppins(
                                        color: AppColors.textGrey,
                                      ),
                                    ),
                                  ),
                                  const Icon(
                                    Icons.mic_none,
                                    color: AppColors.textGrey,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                SliverList(
                  delegate: SliverChildListDelegate([
                    // 1. Horizontal Category Grid (Visible BELOW the collapsed header)
                    const HomeCategoryGrid(),

                    // const SizedBox(height: 10),

                    // 2. Hot Deals Section
                    _buildHorizontalProductList(
                      controller.dashboardSections
                              .firstWhereOrNull((s) => s.title == 'Hot Deals')
                              ?.title ??
                          'Hot Deals',
                      controller.dashboardSections
                              .firstWhereOrNull((s) => s.title == 'Hot Deals')
                              ?.products ??
                          mockHotDeals,
                    ),

                    // 3. Grocery & Kitchen Section (Grid View)
                    _buildGridCategorySection(
                      controller.dashboardSections
                              .firstWhereOrNull(
                                (s) => s.title == 'Grocery & Kitchen',
                              )
                              ?.title ??
                          'Grocery & Kitchen',
                      controller.dashboardSections
                              .firstWhereOrNull(
                                (s) => s.title == 'Grocery & Kitchen',
                              )
                              ?.products ??
                          mockGroceryCategories,
                    ),

                    // 4. Snacks & Drinks Section (Grid View)
                    _buildGridCategorySection(
                      controller.dashboardSections
                              .firstWhereOrNull(
                                (s) => s.title == 'Snacks & Drinks',
                              )
                              ?.title ??
                          'Snacks & Drinks',
                      controller.dashboardSections
                              .firstWhereOrNull(
                                (s) => s.title == 'Snacks & Drinks',
                              )
                              ?.products ??
                          mockGroceryCategories.reversed.toList(),
                    ),

                    // 5. Beauty & Wellness Section (Grid View)
                    _buildGridCategorySection(
                      controller.dashboardSections
                              .firstWhereOrNull(
                                (s) => s.title == 'Beauty & Wellness',
                              )
                              ?.title ??
                          'Beauty & Wellness',
                      controller.dashboardSections
                              .firstWhereOrNull(
                                (s) => s.title == 'Beauty & Wellness',
                              )
                              ?.products ??
                          mockGroceryCategories,
                    ),

                    const SizedBox(height: 100),
                    // Extra space for the floating bottom bar
                  ]),
                ),
              ],
            ),
          ),

          // --- Floating Bottom Navigation Bar ---
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
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildBottomNavItem(
                    Icons.home,
                    'Home',
                    isActive: true,
                    onTap: () {},
                  ),
                  _buildBottomNavItem(
                    Icons.category,
                    'Instamart',
                    onTap: () {},
                  ),
                  _buildBottomNavItem(
                    Icons.shopping_basket,
                    'Categories',
                    onTap: () {},
                  ),
                  _buildBottomNavItem(
                    Icons.person,
                    'Account',
                    onTap: () {
                      Get.toNamed(Routes.PROFILE);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper widget for bottom navigation items
  Widget _buildBottomNavItem(
    IconData icon,
    String label, {
    bool isActive = false,
    required VoidCallback onTap,
  }) {
    final color = isActive ? AppColors.primaryRed : AppColors.textGrey;
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 4),
          Text(label, style: GoogleFonts.poppins(color: color, fontSize: 10)),
        ],
      ),
    );
  }
}
