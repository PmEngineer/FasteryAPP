import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/app_colors.dart';

class SavingsRow extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const SavingsRow({required this.title, required this.value, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, size: 20, color: AppColors.kPrimaryGreen),
              const SizedBox(width: 8),
              Text(
                title,
                style: GoogleFonts.poppins(fontSize: 14, color: AppColors.kDarkText),
              ),
            ],
          ),
          Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.kPrimaryGreen,
            ),
          ),
        ],
      ),
    );
  }
}