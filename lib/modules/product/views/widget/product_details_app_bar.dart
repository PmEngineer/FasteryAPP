import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../dashboard/models/dashboard_section_model.dart';

class ProductDetailsAppBar extends StatelessWidget {
  final ProductItem product;

  const ProductDetailsAppBar({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 400.0,
      pinned: false,
      floating: false,
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          color: AppColors.primaryRed, // Background color for the image area
          child: Stack(
            children: [
              Center(
                child: Image.network(
                  product.imageUrl,
                  fit: BoxFit.contain,
                  height: 400,
                ),
              ),
              Positioned(
                top: 40,
                left: 10,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Get.back(), // Use GetX back navigation
                ),
              ),
              const Positioned(
                top: 40,
                right: 10,
                child: Row(
                  children: [
                    Icon(Icons.bookmark_border, color: Colors.white),
                    SizedBox(width: 10),
                    Icon(Icons.share, color: Colors.white),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}