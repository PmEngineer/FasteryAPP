import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/app_colors.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final String description;
  final String weight;
  final String price;
  final String originalPrice;
  final String discount;
  final String imageUrl;
  final bool isBestseller;
  final VoidCallback onTap;

  const ProductCard({
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
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.add, color: AppColors.primaryPurple, size: 18),
                  ),
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