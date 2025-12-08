// lib/home/widgets/mini_cart_bottom_bar.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constants/app_colors.dart';
import '../../controllers/cart_controller.dart';
import '../cart_screen.dart';

class MiniCartBottomBar extends StatelessWidget {
  final CartController cartController = Get.find<CartController>();

  MiniCartBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (cartController.cartItems.isEmpty) {
        return const SizedBox.shrink(); // Hide if cart is empty
      }

      final totalItems = cartController.totalUniqueItems;
      final totalSavings = cartController.totalSavings.toStringAsFixed(0);

      return Container(
        height: 80, // Height to accommodate content
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: AppColors.background,
          boxShadow: [
            BoxShadow(
              color: Colors.black12.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Left Section: Item Count & Savings
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: AppColors.lightGrey,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          '$totalItems Item${totalItems > 1 ? 's' : ''}',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textDark,
                          ),
                        ),
                      ),
                      const Icon(Icons.keyboard_arrow_up, size: 16, color: AppColors.textDark),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'You save ₹$totalSavings',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: AppColors.primaryRed,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 16),

            // Right Section: View Cart Button
            ElevatedButton(
              onPressed: () {
                // Navigate to Cart Screen
                Get.to(() =>  CartScreen());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryRed, // Use a primary color, assuming AppColors.primaryPurple is blue
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                elevation: 0,
              ),
              child: Text(
                'View Cart',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}