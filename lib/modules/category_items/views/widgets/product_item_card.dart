import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constants/app_colors.dart';

class ProductItemCard extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final String time;
  final String discount;
  final String price;
  final String originalPrice;
  final String quantity;

  const ProductItemCard({
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

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.background,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: AppColors.textGrey.withOpacity(0.1)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image and Bookmark/Plus Icon Stack
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

            // Time and Title
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

            // Discount
            Text(
              discount,
              style: GoogleFonts.poppins(fontSize: 10, color: Colors.green, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),

            // Price and Add Button
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
                          style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '₹$originalPrice',
                          style: GoogleFonts.poppins(
                            fontSize: 10,
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
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: AppColors.primaryRed, // Use a contrasting color for the button
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.add, size: 18, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}