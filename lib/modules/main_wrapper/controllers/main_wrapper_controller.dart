import 'package:fastery/modules/category/controllers/category_controller.dart';
import 'package:fastery/modules/fastery/view/fastery_view.dart';
import 'package:fastery/modules/profile/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../dashboard/controllers/home_controller.dart';
import '../../dashboard/view/home_view/home_view.dart';
import '../../profile/views/profile_view.dart';

class MainController extends GetxController {
  var selectedIndex = 0.obs;

  // **CRUCIAL FIX: Instantiate controllers here**
  @override
  void onInit() {
    Get.put(HomeController());
    Get.put(CategoryController());
    Get.put(ProfileController());
    super.onInit();
  }

  final List<Widget> pages = [
    const HomeView(),
    const FasteryView(),
    const HomeView(),
    const ProfileView(),
  ];

  void changePage(int index) {
    selectedIndex.value = index;
  }
}