import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/app_colors.dart';
import 'offer_item_card.dart';

class SpecialOffers extends StatelessWidget {
  const SpecialOffers();

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Special offers for you',
            style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          Text(
            '34 offers available',
            style: GoogleFonts.poppins(fontSize: 13, color: AppColors.kHintText),
          ),
          const SizedBox(height: 12),
          // Horizontal List of Offer Cards
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                OfferItemCard(
                  isUnlocked: true,
                  title: 'FastUp Fat Burn...',
                  packSize: '1 pack (20 tablets)',
                  imageUrl: 'https://placehold.co/100x120/a9a9a9/ffffff?text=Offer+1',
                ),
                const SizedBox(width: 12),
                OfferItemCard(
                  isUnlocked: false,
                  title: 'Special offer...',
                  packSize: '1 pack (30 tablets)',
                  imageUrl: 'https://placehold.co/100x120/a9a9a9/ffffff?text=Offer+2',
                ),
                const SizedBox(width: 12),
                OfferItemCard(
                  isUnlocked: true,
                  title: 'Another Deal...',
                  packSize: '1 unit',
                  imageUrl: 'https://placehold.co/100x120/a9a9a9/ffffff?text=Offer+3',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}