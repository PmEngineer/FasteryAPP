import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/widgets/profile_header.dart';
import '../../../core/widgets/quick_options_row.dart';
import '../../../core/widgets/settings_list_item.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Obx(
                  () => ProfileHeader(
                name: controller.name.value,
                phone: controller.phone.value,
                email: controller.email.value,
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  child: Column(
                    children: [
                      // Card(
                      //   shape: RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.circular(12),
                      //   ),
                      //   elevation: 0,
                      //   child: ListTile(
                      //     contentPadding: const EdgeInsets.symmetric(
                      //       horizontal: 16,
                      //       vertical: 8,
                      //     ),
                      //     leading: Container(
                      //       width: 48,
                      //       height: 48,
                      //       decoration: BoxDecoration(
                      //         color: Colors.orange.shade100,
                      //         borderRadius: BorderRadius.circular(8),
                      //       ),
                      //       child: const Center(
                      //         child: Text(
                      //           'one',
                      //           style: TextStyle(fontWeight: FontWeight.bold),
                      //         ),
                      //       ),
                      //     ),
                      //     // title: const Text(
                      //     //   'Unlimited free deliveries, extra discounts & more!',
                      //     //   style: TextStyle(fontWeight: FontWeight.w600),
                      //     // ),
                      //     // subtitle: const Text(
                      //     //   'Join now to unlock exclusive benefits',
                      //     // ),
                      //     // // trailing: ElevatedButton(
                      //     // //   onPressed: controller.onJoinNow,
                      //     // //   style: ElevatedButton.styleFrom(
                      //     // //     shape: RoundedRectangleBorder(
                      //     // //       borderRadius: BorderRadius.circular(8),
                      //     // //     ),
                      //     // //   ),
                      //     // //   child: const Text('JOIN NOW'),
                      //     // // ),
                      //   ),
                      // ),
                      const SizedBox(height: 12),
                      const QuickOptionsRow(),
                      const SizedBox(height: 12),
                      Expanded(
                        child: Obx(
                              () => ListView.separated(
                            itemCount: controller.menuItems.length + 1,
                            separatorBuilder: (_, __) => const Divider(height: 1),
                            itemBuilder: (context, index) {
                              if (index == controller.menuItems.length) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 20),
                                  child: Center(
                                    child: ElevatedButton(
                                      onPressed: controller.browsePastOrders,
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.black,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(24),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 24,
                                          vertical: 12,
                                        ),
                                      ),
                                      child: const Text(
                                        'BROWSE PAST ORDERS',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                );
                              }
                              return SettingsListItem(
                                title: controller.menuItems[index],
                                onTap: () => controller.onMenuTap(index),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}