// lib/modules/product/views/widget/product_details_bottom_bar.dart (UPDATED)

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// Assuming these imports are correct based on previous context
import '../../../../core/constants/app_colors.dart';
import '../../../../data/models/product_model.dart';
import '../../../cart/controllers/cart_controller.dart';

class ProductDetailsBottomBar extends StatelessWidget {
  // We now accept all data needed to form the Product model instance
  final Map<String, String> productData;

  // Get the CartController instance
  final CartController cartController = Get.find<CartController>();

  ProductDetailsBottomBar({super.key, required this.productData});

  // Helper method to create the Product instance
  Product _createProduct() {
    return Product(
      title: productData['title'] ?? 'Unknown Product',
      description: productData['description'] ?? '',
      // Map the 'qty' or 'weight' to the weight field in Product model
      weight: productData['weight'] ?? productData['qty'] ?? '1 Unit',
      price: productData['price'] ?? '0',
      originalPrice: productData['original'] ?? '0',
      discount: productData['discount'] ?? '',
      imageUrl: productData['imageUrl'] ?? 'https://via.placeholder.com/150',
      isBestseller: productData['isBestseller'] == 'true',
    );
  }

  // Widget to display Add button or Quantity controls (similar to ProductCard)
  Widget _buildCartControls(Product product) {
    // Determine the product quantity reactively
    final quantity = cartController.getProductQuantity(product);

    if (quantity == 0) {
      // Show ADD button
      return ElevatedButton(
        onPressed: () {
          cartController.addItemToCart(product);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryRed,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child: Text(
          'ADD',
          style: GoogleFonts.poppins(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      );
    } else {
      // Show Quantity Picker (Increment/Decrement)
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.primaryRed, // Red background for the whole control
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Decrement Button
            GestureDetector(
              onTap: () => cartController.removeItemFromCart(product),
              child: Icon(quantity == 1 ? Icons.delete_outline : Icons.remove,
                  color: Colors.white, size: 24),
            ),

            // Quantity Display
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                '$quantity',
                style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                ),
              ),
            ),

            // Increment Button
            GestureDetector(
              onTap: () => cartController.addItemToCart(product),
              child: const Icon(Icons.add, color: Colors.white, size: 24),
            ),
          ],
        ),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    // Create the product instance here
    final product = _createProduct();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
      ),
      child: Row(
        children: [
          // Price and Discount Info
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      '₹${productData['price']}',
                      style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textDark),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '₹${productData['original']}',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: AppColors.textGrey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
                Text(
                  productData['discount']!,
                  style: GoogleFonts.poppins(fontSize: 12, color: AppColors.primaryRed, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          Obx(() => _buildCartControls(product)),
        ],
      ),
    );
  }
}