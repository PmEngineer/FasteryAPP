// lib/cart/widgets/full_bill_summary_card.dart (UPDATED)

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constants/app_colors.dart';
import 'bill_row.dart';
import 'saving_row.dart';
import '../../../cart/controllers/cart_controller.dart'; // Import controller

class FullBillSummaryCard extends StatelessWidget {
  const FullBillSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find<CartController>();

    // Wrap the entire content in Obx
    return Obx(() {
      final subtotal = cartController.subtotal.toStringAsFixed(2);
      final deliveryFee = cartController.deliveryFee.toStringAsFixed(2);
      final handlingFee = cartController.handlingFee.toStringAsFixed(2);
      final gstCharges = cartController.gstCharges.toStringAsFixed(2);
      final grandTotal = cartController.grandTotal.toStringAsFixed(2);
      final totalMRP = cartController.totalMRP.toStringAsFixed(2);

      final itemDiscountSavings = cartController.itemDiscountSavings.toStringAsFixed(2);
      final deliveryFeeSavings = (BASE_DELIVERY_FEE - cartController.deliveryFee).toStringAsFixed(2);
      final handlingFeeSavings = cartController.handlingFeeSavings.toStringAsFixed(2);

      // The 'Total To Pay' before savings: Total MRP + Base Delivery + Base Handling + GST on those
      final totalToPayBeforeSavings = cartController.totalToPayBeforeSavings.toStringAsFixed(2);


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
            // Bill Summary
            Text(
              'Bill Summary',
              style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            BillRow(title: 'Item Total', value: '₹$subtotal'),
            BillRow(
              title: 'Delivery Fee',
              value: deliveryFee == '0.00' ? 'FREE' : '₹$deliveryFee',
              valueColor: deliveryFee == '0.00' ? AppColors.kPrimaryGreen : AppColors.textDark,
            ),
            BillRow(
              title: 'Handling Fee',
              value: handlingFee == '0.00' ? 'FREE' : '₹$handlingFee',
              valueColor: AppColors.kPrimaryGreen, // Assuming handling fee is always free/saved
            ),
            BillRow(title: 'GST Charges (govt. taxes)', value: '₹$gstCharges'),

            // To Pay Row
            Padding(
              padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'To Pay',
                    style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  Text.rich(
                    TextSpan(
                      text: '₹$totalToPayBeforeSavings ', // Total before all discounts
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: AppColors.kHintText,
                        decoration: TextDecoration.lineThrough,
                      ),
                      children: [
                        TextSpan(
                          text: '₹$grandTotal', // Final amount
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.kDarkText,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const Divider(height: 1, color: AppColors.kLightBorder),
            const SizedBox(height: 12),

            // Savings Section
            Text(
              'Savings on this order',
              style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.kPrimaryGreen),
            ),
            const SizedBox(height: 8),
            if (double.parse(itemDiscountSavings) > 0)
              SavingsRow(
                  title: 'Discount on MRP',
                  value: '₹$itemDiscountSavings',
                  icon: Icons.confirmation_number_outlined
              ),
            if (double.parse(deliveryFeeSavings) > 0)
              SavingsRow(
                  title: 'Savings on Delivery Fee',
                  value: '₹$deliveryFeeSavings',
                  icon: Icons.local_shipping_outlined
              ),
            if (double.parse(handlingFeeSavings) > 0)
              SavingsRow(
                  title: 'Savings on Handling fee',
                  value: '₹$handlingFeeSavings',
                  icon: Icons.savings_outlined
              ),
          ],
        ),
      );
    });
  }
}