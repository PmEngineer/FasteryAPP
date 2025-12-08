import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/app_colors.dart';

class AddItemsBanner extends StatelessWidget {
  const AddItemsBanner();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.yellow.shade50,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: AppColors.kLightBorder),
      ),
      child: Row(
        children: [
          const Icon(Icons.warning_amber_rounded, size: 20, color: Colors.amber),
          const SizedBox(width: 8),
          Text(
            'Add items worth ₹973 more to apply',
            style: GoogleFonts.poppins(fontSize: 13, color: AppColors.kDarkText.withOpacity(0.9)),
          ),
        ],
      ),
    );
  }
}