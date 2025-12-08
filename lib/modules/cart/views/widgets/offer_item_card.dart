import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/app_colors.dart';

class OfferItemCard extends StatelessWidget {
  final bool isUnlocked;
  final String title;
  final String packSize;
  final String imageUrl;

  const OfferItemCard({
    required this.isUnlocked,
    required this.title,
    required this.packSize,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: AppColors.kLightBorder),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // UNLOCKED/SPECIAL OFFER Label
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 4),
            decoration: BoxDecoration(
              color: isUnlocked ? AppColors.kPrimaryRed.withOpacity(0.1) : AppColors.kPurpleCard.withOpacity(0.1),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              border: Border.all(color: isUnlocked ? AppColors.kPrimaryRed : AppColors.kPurpleCard),
            ),
            child: Center(
              child: Text(
                isUnlocked ? 'UNLOCKED' : 'SPECIAL OFFER',
                style: GoogleFonts.poppins(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: isUnlocked ? AppColors.kPrimaryRed : AppColors.kPurpleCard,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      isUnlocked ? 'Add' : 'View',
                      style: GoogleFonts.poppins(fontSize: 12, color: AppColors.kPrimaryRed, fontWeight: FontWeight.w600),
                    ),
                    const Icon(Icons.add_circle, color: AppColors.kPrimaryRed, size: 20),
                  ],
                ),
                const SizedBox(height: 8),
                Image.network(
                  imageUrl,
                  height: 80,
                  width: double.infinity,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) =>
                      Container(
                        height: 80,
                        color: Colors.grey.shade100,
                        child: const Center(child: Icon(Icons.redeem, color: AppColors.kHintText)),
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  title,
                  style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.kDarkText),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  packSize,
                  style: GoogleFonts.poppins(fontSize: 11, color: AppColors.kHintText),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}