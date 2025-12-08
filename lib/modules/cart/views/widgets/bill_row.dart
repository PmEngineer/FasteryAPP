import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/app_colors.dart';

class BillRow extends StatelessWidget {
  final String title;
  final String value;
  final Color? valueColor;
  final bool isLink;

  const BillRow({
    required this.title,
    required this.value,
    this.valueColor,
    this.isLink = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(fontSize: 14, color: isLink ? AppColors.kPrimaryRed : AppColors.kHintText),
          ),
          Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: valueColor ?? AppColors.kDarkText,
              fontWeight: valueColor == AppColors.kPrimaryGreen ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}