import 'package:fastery/modules/all_items/controllers/all_items_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

// Import CartController and Product model
import '../../../../data/models/product_model.dart'; // <<< Ensure this path is correct
import '../../../cart/controllers/cart_controller.dart'; // <<< Ensure this path is correct

class AllItemsCard extends StatelessWidget {
  final ItemModel item;
  AllItemsCard({super.key, required this.item});

  // Get the CartController instance
  final CartController cartController = Get.find<CartController>();

  // Helper to convert ItemModel to the required Product model for the CartController
  Product get _product {
    return Product(
      title: item.title,
      description: item.description,
      weight: item.weight,
      // NOTE: You must ensure ItemModel's price fields are accessible and convertible to String as expected by Product model
      price: item.currentPrice.toString(),
      originalPrice: item.originalPrice.toString(),
      discount: item.discount.toString(), // Assuming discount is a number like 0.1 for 10%
      // NOTE: For simplicity, ItemModel.imagePath is used. In a real app, you might use a shared property like 'imageUrl'
      imageUrl: item.imagePath,
      isBestseller: item.isBestseller,
    );
  }

  // Helper to call the add function
  void _addItem() {
    cartController.addItemToCart(_product);
  }

  // Helper to call the remove function
  void _removeItem() {
    cartController.removeItemFromCart(_product);
  }


  @override
  Widget build(BuildContext context) {
    final currencyFormatter = NumberFormat.currency(
      locale: 'en_IN',
      symbol: '₹',
      decimalDigits: 0,
    );

    // Get the current quantity of this item in the cart (will be 0 if not in cart)
    // NOTE: This getter assumes item.title is the unique identifier used by Product's operator ==
    final int quantity = cartController.getProductQuantity(_product);

    return Card(
      color: Colors.white,
      elevation: 0,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: BorderSide(color: Colors.grey[300]!, width: 0.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // --- Image/Header Section ---
          Stack(
            children: [
              // Image container
              Container(
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFFF9E8EC),
                  image: DecorationImage(
                    image: AssetImage(item.imagePath.startsWith('assets/') ? item.imagePath : 'assets/placeholder.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              // Bookmark and Add/Quantity controls
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Row(
                  children: [
                    const Icon(Icons.bookmark_border, color: Colors.black, size: 24),
                    const Spacer(),
                    // >>> START OF MODIFIED ADD/QUANTITY WIDGET <<<
                    Obx(
                          () {
                        final currentQuantity = cartController.getProductQuantity(_product);

                        if (currentQuantity > 0) {
                          // Display quantity picker if the item is in the cart
                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.grey[300]!),
                            ),
                            child: Row(
                              children: [
                                // Decrement Button
                                InkWell(
                                  onTap: _removeItem,
                                  child: const Padding(
                                    padding: EdgeInsets.all(4.0),
                                    child: Icon(Icons.remove, color: Color(0xFFE91E63), size: 20),
                                  ),
                                ),
                                // Quantity Text
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Text(
                                    '$currentQuantity',
                                    style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 14),
                                  ),
                                ),
                                // Increment Button
                                InkWell(
                                  onTap: _addItem,
                                  child: const Padding(
                                    padding: EdgeInsets.all(4.0),
                                    child: Icon(Icons.add, color: Color(0xFFE91E63), size: 20),
                                  ),
                                ),
                              ],
                            ),
                          );
                        } else {
                          // Display single Add icon if the item is NOT in the cart
                          return GestureDetector(
                            onTap: _addItem, // Call the add function
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(color: Colors.grey[300]!),
                              ),
                              child: const Icon(Icons.add, color: Color(0xFFE91E63), size: 24),
                            ),
                          );
                        }
                      },
                    ),
                    // >>> END OF MODIFIED ADD/QUANTITY WIDGET <<<
                  ],
                ).paddingSymmetric(horizontal: 8.0, vertical: 4.0),
              ),
              // Bestseller tag
              Positioned(
                bottom: 0,
                left: 0,
                child: item.isBestseller ? Container( // Check if bestseller before displaying
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: const BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                  child: Text(
                    'Bestseller',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ) : const SizedBox.shrink(),
              ),
            ],
          ),

          // --- Details Section (Unchanged) ---
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ... (rest of the widget remains the same)
                // Weight
                Text(
                  item.weight,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 4),
                // Rating and Reviews
                Row(
                  children: [
                    Text(
                      '${item.deliveryTime} MINS',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Icon(Icons.star, color: Colors.yellow[700], size: 14),
                    Text(
                      ' ${item.rating.toStringAsFixed(1)}',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      ' (${item.reviews}k)',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                // Title
                Text(
                  item.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                // Description
                Text(
                  item.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 8),
                // Discount Tag
                Text(
                  '${(item.discount * 100).toStringAsFixed(0)}% OFF',
                  style: GoogleFonts.poppins(
                    color: Colors.green[700],
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                // Price
                Row(
                  children: [
                    Text(
                      currencyFormatter.format(item.currentPrice),
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      currencyFormatter.format(item.originalPrice),
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Colors.grey,
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
    );
  }
}