import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constants/app_colors.dart';

class ProductPaymentOffers extends StatelessWidget {
  const ProductPaymentOffers({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.percent_rounded, color: AppColors.primaryRed, size: 24),
        const SizedBox(width: 8),
        Text(
          '₹150 OFF',
          style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.primaryRed),
        ),
        const SizedBox(width: 8),
        Text(
          'Payment Offers',
          style: GoogleFonts.poppins(fontSize: 14, color: AppColors.textDark),
        ),
      ],
    );
  }
}