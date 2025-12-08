import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/app_colors.dart';

class OfferCard extends StatelessWidget {
  const OfferCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0).copyWith(top: 8),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: AppColors.kLightBorder),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(Icons.percent, size: 24, color: AppColors.kPrimaryGreen),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Get extra ₹50 OFF',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.kPrimaryGreen,
                    ),
                  ),
                  Text(
                    'Code: ZEP-EVERYDAY50',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: AppColors.kHintText,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.kPrimaryRed,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  elevation: 0,
                ),
                child: Text('Apply', style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w600)),
              ),
            ],
          ),
          const Divider(height: 24),
          GestureDetector(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'View all coupons',
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    color: AppColors.kPrimaryRed,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Icon(Icons.keyboard_arrow_right, color: AppColors.kPrimaryRed, size: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}