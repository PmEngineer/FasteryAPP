import 'package:get/get.dart';

class ProfileController extends GetxController {
  final name = 'Test User'.obs;
  final phone = '+91 - 9452-xxx-xxx'.obs;
  final email = 'test_user@xyz.com'.obs;

  // Example menu items (simple strings here; can be model)
  final menuItems = <String>[
    'My Vouchers',
    'Account Statements',
    'Corporate Rewards',
    'Student Offers',
    'My Shopy Wishlist',
    'Favourites',
  ].obs;

  // Example: handle menu tap
  void onMenuTap(int index) {
    Get.snackbar('Tapped', menuItems[index]);
  }

  // void onJoinNow() {
  //   Get.snackbar('Join', 'Join now pressed');
  // }

  void browsePastOrders() {
    Get.snackbar('Browse', 'Browse past orders');
  }
 }