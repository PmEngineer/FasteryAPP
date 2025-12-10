import 'package:fastery/core/widgets/custom_app_bar.dart';
import 'package:fastery/modules/all_items/views/widgets/all_items_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/all_items_controller.dart';

class AllItemsView extends GetView<AllItemsController> {
  const AllItemsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: "Hot Deals"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Obx(
                  () => GridView.builder(
                padding: const EdgeInsets.all(8.0),
                itemCount: controller.hotDeals.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.50, // Adjust this ratio to fit the card content
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemBuilder: (context, index) {
                  final item = controller.hotDeals[index];
                  return AllItemsCard(item: item,);
                },
              ),
            ),
          ),
          // Bottom section: FREE DELIVERY banner
          Container(
            height: 60,
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.center,
            child: Row(
              children: [
                const Icon(Icons.motorcycle, color: Color(0xFFF06292)),
                const SizedBox(width: 8),
                Text(
                  'FREE DELIVERY on orders above ₹99',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
      // Placeholder for the bottom thin navigation bar
      bottomNavigationBar: Container(
        height: 5,
        color: Colors.grey[200],
      ),
    );
  }
  
}