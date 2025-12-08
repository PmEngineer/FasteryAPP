// lib/cart/widgets/bill_summary_overview.dart (UPDATED)

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constants/app_colors.dart';
import 'bill_row.dart';
import '../../../cart/controllers/cart_controller.dart'; // Import controller

class BillSummaryOverview extends StatelessWidget {
  const BillSummaryOverview({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find<CartController>();

    // Wrap the dynamic part in Obx
    return Obx(() {
      final subtotal = cartController.subtotal.toStringAsFixed(0);
      final deliveryFee = cartController.deliveryFee;
      final deliveryFeeText = deliveryFee == 0.0 ? 'FREE' : '₹${deliveryFee.toStringAsFixed(0)}';

      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(color: AppColors.kLightBorder),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bill Summary',
              style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            BillRow(title: 'Item Total', value: '₹$subtotal'),
            BillRow(
              title: 'Delivery Fee',
              value: deliveryFeeText,
              isLink: true,
              valueColor: deliveryFee == 0.0 ? AppColors.kPrimaryGreen : AppColors.textDark,
            ),

            // Free Delivery/Savings Message
            Text(
              cartController.freeDeliveryMessage,
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: deliveryFee == 0.0 ? AppColors.kPrimaryGreen : AppColors.kPrimaryRed, // Change color based on status
              ),
            ),
            const SizedBox(height: 12),
            const Divider(height: 1, color: AppColors.kLightBorder),
          ],
        ),
      );
    });
  }
}