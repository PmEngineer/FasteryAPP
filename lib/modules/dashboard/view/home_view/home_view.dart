import 'package:fastery/modules/cart/views/widgets/mini_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../service/views/widgets/services_grid.dart';
import '../../controllers/home_controller.dart';
import '../widgets/restaurnet_list_view_content.dart';
import '../widgets/search_category_header.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryRed,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.background,
          body: Obx(
                () => CustomScrollView(
              slivers: [
                // -------------------------------
                // SIMPLE LOCATION APPBAR
                // Hides automatically when scrolling up
                // -------------------------------
                SliverAppBar(
                  expandedHeight: 50,
                  pinned: false,
                  floating: false,
                  snap: false,
                  backgroundColor: controller.headerBackgroundColor,
                  elevation: 0,
                  automaticallyImplyLeading: false,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: GestureDetector(
                        onTap: (){
                          Get.toNamed(Routes.LOCATION_SELECTION);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Row(
                            children: [
                              const Icon(Icons.access_time,
                                  color: Colors.white, size: 16),
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

                              const Icon(Icons.keyboard_arrow_down,
                                  color: Colors.white, size: 10),

                              const SizedBox(width: 20),

                              GestureDetector(
                                onTap: () => Get.toNamed(Routes.PROFILE),
                                child: const Icon(
                                  Icons.person_outline,
                                  color: AppColors.background,
                                  size: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // ---------------------------------------------------
                // PINNED SEARCH + CATEGORIES — ALWAYS VISIBLE
                // ---------------------------------------------------
                SliverPersistentHeader(
                  pinned: true,
                  delegate: SearchCategoryHeader(controller),
                ),

                // -------------------------------
                // MAIN PAGE CONTENT
                // -------------------------------
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16.0, top: 20.0, bottom: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Top 153 shops to explore',
                              style: GoogleFonts.poppins(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'Featured Shops',
                              style: GoogleFonts.poppins(
                                  fontSize: 16, color: Colors.black54),
                            ),
                          ],
                        ),
                      ),

                      RestaurantListViewContent(),
                      const SizedBox(height: 20),
                      ExploreServicesSection(),
                      SizedBox(height: 20,),
                    ],
                  ),
                ),
              ],
            ),
          ),

          bottomNavigationBar: MiniCartBottomBar(),
        ),
      ),
    );
  }
}



