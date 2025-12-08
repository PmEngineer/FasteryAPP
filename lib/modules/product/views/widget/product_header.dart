import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/app_colors.dart';

class ProductHeader extends StatelessWidget {
  final String ProductTitle;
  const ProductHeader({super.key, required this.ProductTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('8 MINS', style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.primaryRed)),
            const Spacer(),
            const Icon(Icons.star, color: Colors.orange, size: 16),
            Text('4.5', style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w600)),
            Text('(62.5k)', style: GoogleFonts.poppins(fontSize: 12, color: AppColors.textGrey)),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          ProductTitle,
          style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(
          'Tangy achaari-flavored crunchy chips',
          style: GoogleFonts.poppins(fontSize: 12, color: AppColors.textGrey),
        ),
      ],
    );
  }
}
