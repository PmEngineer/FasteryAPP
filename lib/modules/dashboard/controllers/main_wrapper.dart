import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/app_colors.dart';
import '../../fastery/view/fastery_view.dart';
import '../view/home_view/home_view.dart';
import '../view/widgets/bottom_nav_item.dart';

class MainController extends GetxController {
  var selectedIndex = 0.obs;

  final List<Widget> pages = [
    const HomeView(),
    const FasteryView(),
    const HomeView(),
    const FasteryView(),
  ];

  void changePage(int index) {
    selectedIndex.value = index;
  }
}

// 2. Main Wrapper Widget
class MainWrapper extends StatelessWidget {
  const MainWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the controller
    final MainController controller = Get.put(MainController());

    return Scaffold(
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
    );
  }

  // 3. Build the Bottom Bar using the custom widget
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
              'Instamart',
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
              'Account',
              isActive: controller.selectedIndex.value == 3,
              onTap: () => controller.changePage(3),
            ),
          ],
        ),
      ),
    );
  }
}