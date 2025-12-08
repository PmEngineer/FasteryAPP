import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/app_colors.dart';
import 'fee_details.dart';

class NoFeesCard extends StatelessWidget {
  const NoFeesCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: AppColors.kLightBorder),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Purple Zero Icon (Simulated)
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: AppColors.kPurpleCard.withOpacity(0.8),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              '₹0',
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 12),
          // Text Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'NO FEES',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.kDarkText,
                  ),
                ),
                const SizedBox(height: 4),
                Wrap(
                  spacing: 10.0,
                  runSpacing: 4.0,
                  children: [
                    FeeDetail(text: 'RD Handling Fee'),
                    FeeDetail(text: 'RD Rain & Surge Fee'),
                    FeeDetail(text: 'RD Delivery Fee above ₹99'),
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