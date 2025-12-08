// set bottom bar and increment and decrement in product card also

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../data/models/product_model.dart';
import '../../../cart/controllers/cart_controller.dart';

class ProductCard extends StatelessWidget {
  final CartController cartController = Get.find<CartController>();
  final String title;
  final String description;
  final String weight;
  final String price;
  final String originalPrice;
  final String discount;
  final String imageUrl;
  final bool isBestseller;
  final VoidCallback onTap;

  ProductCard({
    super.key,
    required this.title,
    required this.description,
    required this.weight,
    required this.price,
    required this.originalPrice,
    required this.discount,
    required this.imageUrl,
    this.isBestseller = false,
    required this.onTap,
  });

  // Helper method to create the product instance once
  Product get productInstance => Product.fromCard(
    title: title,
    description: description,
    weight: weight,
    price: price,
    originalPrice: originalPrice,
    discount: discount,
    imageUrl: imageUrl,
    isBestseller: isBestseller,
  );

  Widget _buildCartControls() {
    final quantity = cartController.getProductQuantity(productInstance);

    if (quantity == 0) {
      // Show Add button
      return GestureDetector(
        onTap: () {
          cartController.addItemToCart(productInstance);
        },
        child: Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(Icons.add, color: AppColors.primaryPurple, size: 18),
        ),
      );
    } else {
      // Show Quantity Picker (Increment/Decrement)
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.primaryPurple.withOpacity(0.5)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Decrement Button
            GestureDetector(
              onTap: () => cartController.removeItemFromCart(productInstance),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Icon(quantity == 1 ? Icons.delete_outline : Icons.remove,
                    color: AppColors.primaryPurple, size: 18),
              ),
            ),

            // Quantity Display
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Text(
                '$quantity',
                style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textDark
                ),
              ),
            ),

            // Increment Button
            GestureDetector(
              onTap: () => cartController.addItemToCart(productInstance),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.0),
                child: Icon(Icons.add, color: AppColors.primaryPurple, size: 18),
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150, // Fixed width for horizontal scrolling
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: AppColors.lightGrey,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Image Area with Bestseller/Discount Tags ---
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                  child: Image.network(
                    imageUrl,
                    height: 100,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      height: 100,
                      color: AppColors.inactiveIndicator,
                      child: Center(child: Text('Item Image', style: GoogleFonts.poppins(fontSize: 12))),
                    ),
                  ),
                ),
                if (isBestseller)
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: AppColors.primaryPurple,
                        borderRadius: const BorderRadius.only(topRight: Radius.circular(8)),
                      ),
                      child: Text(
                        'Bestseller',
                        style: GoogleFonts.poppins(
                          color: AppColors.background,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                  top: 8,
                  right: 8,
                  child: Obx(() => _buildCartControls()), // <--- Obx wraps the control logic
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // --- Discount ---
                  if (discount.isNotEmpty)
                    Text(
                      discount,
                      style: GoogleFonts.poppins(
                        color: AppColors.primaryRed,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  // --- Weight ---
                  Text(
                    weight,
                    style: GoogleFonts.poppins(
                      color: AppColors.textGrey,
                      fontSize: 10,
                    ),
                  ),
                  const SizedBox(height: 4),
                  // --- Title ---
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                      color: AppColors.textDark,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // --- Price ---
                  Row(
                    children: [
                      Text(
                        '₹$price',
                        style: GoogleFonts.poppins(
                          color: AppColors.textDark,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '₹$originalPrice',
                        style: GoogleFonts.poppins(
                          color: AppColors.textGrey,
                          fontSize: 12,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}