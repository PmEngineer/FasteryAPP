import 'package:fastery/modules/cart/views/cart_screen.dart';
import 'package:fastery/modules/category/view/category_view.dart';
import 'package:fastery/modules/profile/views/profile_view.dart';
import 'package:fastery/modules/service/views/service_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Import the controllers that are causing the crash
import '../../../core/constants/app_colors.dart';
import '../../dashboard/view/home_view/home_view.dart';
import '../../dashboard/view/widgets/bottom_nav_item.dart';
import '../../service/controllers/service_controller.dart';
import '../../category/controllers/category_controller.dart';
// NOTE: Make sure to import all controllers used in the 'pages' list

class MainController extends GetxController {
  var selectedIndex = 0.obs;

  @override
  void onInit() {
    // 💡 FIX: Initialize all required sub-controllers here using Get.lazyPut
    // This ensures the controllers exist in memory before their respective
    // views (ServiceView, CategoryView) try to access them via GetView<T>.
    Get.lazyPut(() => ServiceController());
    Get.lazyPut(() => CategoryController());
    // Get.lazyPut(() => CartController()); // If CartScreen uses a controller
    // Get.lazyPut(() => ProfileController()); // If ProfileView uses a controller

    super.onInit();
  }

  final List<Widget> pages = [
    const HomeView(),
    const ServiceView(),
    const CategoryView(),
    CartScreen()
  ];

  void changePage(int index) {
    selectedIndex.value = index;
  }
}

// 2. Main Wrapper Widget (No change needed here)
class MainWrapper extends StatelessWidget {
  const MainWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the controller
    final MainController controller = Get.put(MainController());

    return SafeArea(
      top: false,
      child: Scaffold(
        // ... (rest of the MainWrapper code remains the same)
        backgroundColor: AppColors.background,
        // The body uses Obx to react to index changes and switch the screen
        body: Obx(
              () => IndexedStack(
            index: controller.selectedIndex.value,
            children: controller.pages,
          ),
        ),

        // The bottomNavigationBar property of Scaffold is the cleanest way
        bottomNavigationBar: _buildFloatingBottomBar(controller),
      ),
    );
  }
  Widget _buildFloatingBottomBar(MainController controller) {
    return Container(
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
      child: Obx(
            () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavItem(
              Icons.home,
              'Home',
              isActive: controller.selectedIndex.value == 0,
              onTap: () => controller.changePage(0),
            ),
            BottomNavItem(
              Icons.category,
              'Fastery',
              isActive: controller.selectedIndex.value == 1,
              onTap: () => controller.changePage(1),
            ),
            BottomNavItem(
              Icons.shopping_basket,
              'Categories',
              isActive: controller.selectedIndex.value == 2,
              onTap: () => controller.changePage(2),
            ),
            BottomNavItem(
              Icons.person,
              'Cart',
              isActive: controller.selectedIndex.value == 3,
              onTap: () => controller.changePage(3),
            ),
          ],
        ),
      ),
    );
  }
}