import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../data/models/product_model.dart';
import '../../controllers/cart_controller.dart';
import 'qty_button.dart';

class CartItemCard extends StatelessWidget {
  final CartItem cartItem;
  final String name;
  final String quantity;
  final String price;
  final String mrp;
  final String imageUrl;
  final CartController cartController = Get.find<CartController>();

  CartItemCard({
    super.key,
    required this.cartItem,
    required this.name,
    required this.quantity,
    required this.price,
    required this.mrp,
    required this.imageUrl,
  });

  void _changeQuantity(bool isIncrement) {
    if (isIncrement) {
      cartController.addItemToCart(cartItem.product); // The existing method handles incrementing
    } else {
      // Create a method in CartController to handle decrement/removal
      cartController.removeItemFromCart(cartItem.product);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: AppColors.kLightBorder),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            imageUrl,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) =>
                Container(
                  width: 60,
                  height: 60,
                  color: Colors.grey.shade200,
                  child: const Center(child: Icon(Icons.image, color: AppColors.kHintText)),
                ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: GoogleFonts.poppins(fontSize: 14, color: AppColors.kDarkText),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  quantity,
                  style: GoogleFonts.poppins(fontSize: 12, color: AppColors.kHintText),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                price,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.kDarkText,
                ),
              ),
              Text(
                '₹$mrp',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: AppColors.kHintText,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              const SizedBox(height: 8),
              // Quantity Picker
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.kLightBorder),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    QtyButton(
                      icon: Icons.remove,
                      color: AppColors.kPrimaryRed,
                      onTap: () => _changeQuantity(false), // Decrement
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      // Display the actual quantity from the CartItem model
                      child: Text(
                          '${cartItem.quantity}',
                          style: GoogleFonts.poppins(fontWeight: FontWeight.w600)
                      ),
                    ),
                    QtyButton(
                      icon: Icons.add,
                      color: AppColors.kPrimaryGreen,
                      onTap: () => _changeQuantity(true), // Increment
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}