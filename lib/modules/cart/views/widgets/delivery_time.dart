import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/app_colors.dart';

class DeliveryTime extends StatelessWidget {
  const DeliveryTime();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          const Icon(Icons.bolt, size: 20, color: AppColors.kPrimaryRed),
          const SizedBox(width: 8),
          Text(
            'Delivery in 11 mins',
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.kDarkText,
            ),
          ),
        ],
      ),
    );
  }
}