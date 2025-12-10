import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX for controller access and Obx
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../data/models/product_model.dart';
import '../../../cart/controllers/cart_controller.dart'; // Ensure this path is correct

class ProductItemCard extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final String time;
  final String discount;
  final String price;
  final String originalPrice;
  final String quantity; // This is the weight/size, not the cart quantity

   ProductItemCard({
    super.key,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.time,
    required this.discount,
    required this.price,
    required this.originalPrice,
    required this.quantity,
  });

  // Access the CartController instance
  final CartController cartController = Get.find<CartController>();

  // Helper method to convert card data into a Product model
  Product _getProduct() {
    return Product.fromCard(
      title: title,
      description: description,
      weight: quantity,
      price: price,
      originalPrice: originalPrice,
      discount: discount,
      imageUrl: imageUrl,
    );
  }

  @override
  Widget build(BuildContext context) {
    // 1. Create the Product object for this card
    final Product product = _getProduct();

    return Card(
      color: AppColors.background,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: AppColors.textGrey.withOpacity(0.1)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ... (Image and Bookmark/Plus Icon Stack remains the same)
            Stack(
              children: [
                Center(
                  child: Image.network(imageUrl, height: 100, fit: BoxFit.cover),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: AppColors.textGrey.withOpacity(0.3)),
                    ),
                    child: const Icon(Icons.bookmark_border, size: 16, color: AppColors.textGrey),
                  ),
                ),
                // AD badge
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text('AD', style: GoogleFonts.poppins(fontSize: 8, color: Colors.white)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // ... (Time, Title, Description, and Discount sections remain the same)
            Text(
              time,
              style: GoogleFonts.poppins(fontSize: 10, color: AppColors.textGrey),
            ),
            Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            Text(
              description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(fontSize: 10, color: AppColors.textGrey),
            ),
            const SizedBox(height: 4),
            Text(
              discount,
              style: GoogleFonts.poppins(fontSize: 10, color: Colors.green, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),

            // --- Price and Add Button (Updated) ---
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          '₹$price',
                          style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '₹$originalPrice',
                          style: GoogleFonts.poppins(
                            fontSize: 8,
                            color: AppColors.textGrey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      quantity,
                      style: GoogleFonts.poppins(fontSize: 10, color: AppColors.textGrey),
                    ),
                  ],
                ),
                // 2. Use Obx and check cart quantity to determine button state
                Obx(() {
                  final int currentQuantity = cartController.getProductQuantity(product);

                  if (currentQuantity == 0) {
                    // Show the 'Add' button
                    return GestureDetector(
                      onTap: () {
                        // 3. Call addItemToCart when the '+' is pressed
                        cartController.addItemToCart(product);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: AppColors.primaryRed,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(Icons.add, size: 14, color: Colors.white),
                      ),
                    );
                  } else {
                    // Show the quantity picker when items are in the cart
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.textGrey.withOpacity(0.3)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          // Decrement button
                          _buildQtyButton(
                            icon: Icons.remove,
                            onTap: () => cartController.removeItemFromCart(product),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 2.0),
                            // Display the current quantity
                            child: Text(
                              '$currentQuantity',
                              style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 10),
                            ),
                          ),
                          // Increment button
                          _buildQtyButton(
                            icon: Icons.add,
                            onTap: () => cartController.addItemToCart(product),
                          ),
                        ],
                      ),
                    );
                  }
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQtyButton({required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(4),
        color: Colors.transparent, // Needed for InkWell/GestureDetector tap area
        child: Icon(
          icon,
          size: 14,
          color: AppColors.primaryRed,
        ),
      ),
    );
  }
}