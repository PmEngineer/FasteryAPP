import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constants/app_colors.dart';

class FilterPill extends StatelessWidget {
  final String label;
  final IconData? icon;
  final Color? color;

  const FilterPill({super.key, required this.label, this.icon, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.textGrey.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) Icon(icon, size: 16, color: color ?? AppColors.textDark),
          if (icon != null) const SizedBox(width: 4),
          Text(
            label,
            style: GoogleFonts.poppins(fontSize: 12, color: AppColors.textDark),
          ),
        ],
      ),
    );
  }
}

class DropdownFilterPill extends StatelessWidget {
  final String label;
  final IconData icon;

  const DropdownFilterPill({super.key, required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.textGrey.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: AppColors.textDark),
          const SizedBox(width: 4),
          Text(
            label,
            style: GoogleFonts.poppins(fontSize: 12, color: AppColors.textDark),
          ),
          const Icon(Icons.keyboard_arrow_down, size: 16, color: AppColors.textDark),
        ],
      ),
    );
  }
}


class ProductFilterBar extends StatelessWidget {
  const ProductFilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          // Basic Pills
          const DropdownFilterPill(label: 'Sort By', icon: Icons.sort),
          const DropdownFilterPill(label: 'Type', icon: Icons.local_offer_outlined),
          const DropdownFilterPill(label: 'Price', icon: Icons.attach_money),

          // Action/Chip Pills
          FilterPill(
            label: 'Price Drop',
            icon: Icons.trending_down,
            color: Colors.red,
          ),
          FilterPill(
            label: 'Trending',
            icon: Icons.thumb_up_alt_outlined,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}