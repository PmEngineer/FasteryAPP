import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/app_colors.dart';

class FeeDetail extends StatelessWidget {
  final String text;
  const FeeDetail({required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.circle, size: 6, color: AppColors.kHintText),
        const SizedBox(width: 4),
        Text(text, style: GoogleFonts.poppins(fontSize: 12, color: AppColors.kHintText)),
      ],
    );
  }
}