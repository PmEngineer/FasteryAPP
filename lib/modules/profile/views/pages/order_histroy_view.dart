import 'package:fastery/core/widgets/custom_app_bar_2.dart';
import 'package:fastery/modules/profile/views/pages/rate_order_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constants/app_colors.dart'; // Needed for SystemChrome


class OrdersHistoryView extends StatelessWidget {
  const OrdersHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    // Set system bar colors to match the app (white background, dark icons)
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: AppColors.background, // Match the app bar color
    ));

    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      appBar: CustomAppBar2(title: "Your Orders"),
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.only(top: 10, bottom: 100), // Add padding for the bottom bar
            children: const [
              OrderCard(
                orderStatus: 'Order delivered',
                dateTime: 'Placed at 5th Dec 2025, 08:50 am',
                price: '313',
                productCount: 3,
              ),
              OrderCard(
                orderStatus: 'Order delivered',
                dateTime: 'Placed at 26th Nov 2025, 09:05 am',
                price: '203',
                productCount: 1,
              ),
              OrderCard(
                orderStatus: 'Order delivered',
                dateTime: 'Placed at 20th Nov 2025, 10:57 pm',
                price: '399',
                productCount: 5,
              ),
              OrderCard(
                orderStatus: 'Order delivered',
                dateTime: 'Placed at 3rd Nov 2025, 01:00 am',
                price: '117',
                productCount: 2,
              ),
            ],
          ),

          // Fixed Bottom Bar/Overlay
          const Align(
            alignment: Alignment.bottomCenter,
            child: BottomOfferBar(),
          ),
        ],
      ),
    );
  }
}

// --- Reusable Order Card Widget ---

class OrderCard extends StatelessWidget {
  final String orderStatus;
  final String dateTime;
  final String price;
  final int productCount;

  const OrderCard({
    super.key,
    required this.orderStatus,
    required this.dateTime,
    required this.price,
    required this.productCount,
  });

  Widget _buildProductImage(int index) {
    return Container(
      width: 50,
      height: 50,
      margin: const EdgeInsets.only(right: 8.0),
      decoration: BoxDecoration(
        color: AppColors.kLightBorder,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: AppColors.kLightBorder, width: 1),
      ),
      child: Center(
        child: Icon(
          [Icons.local_grocery_store, Icons.fastfood, Icons.eco, Icons.bakery_dining, Icons.liquor][index % 5],
          size: 20,
          color: AppColors.kHintText,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Order Status and Price Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    orderStatus,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.kDarkText,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Icon(
                    Icons.check_circle,
                    size: 16,
                    color: AppColors.kPrimaryGreen,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    '₹$price',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.kDarkText,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(
                    Icons.more_vert,
                    size: 20,
                    color: AppColors.textGrey,
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 4),

          // Date Time
          Text(
            dateTime,
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: AppColors.kHintText,
            ),
          ),

          const SizedBox(height: 12),

          // Product Images
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: productCount,
              itemBuilder: (context, index) {
                return _buildProductImage(index);
              },
            ),
          ),

          const SizedBox(height: 12),

          // Rate Order Button
          Center(
            child: TextButton(
              onPressed: () {
                Get.to(
                      () => RateOrderView(),
                  // ✅ Apply the right-to-left transition here:
                  transition: Transition.rightToLeft,
                  // Optional: Set a smooth duration
                  duration: const Duration(milliseconds: 300),
                );
              },
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                backgroundColor: AppColors.background,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(color: AppColors.lightGrey),
                ),
              ),
              child: Text(
                'Rate Order',
                style: GoogleFonts.poppins(
                  color: AppColors.kDarkText,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// --- Bottom Offer Bar Widget ---

class BottomOfferBar extends StatelessWidget {
  const BottomOfferBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.textDark, // Dark background
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left side: Icon and Offer Text
          Row(
            children: [
              // Icon resembling the logo/offer marker
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: AppColors.background.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    Icons.star_border, // Using a star as a placeholder for the icon
                    color: AppColors.background,
                    size: 18,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Unlock extra ₹50 OFF',
                    style: GoogleFonts.poppins(
                      color: AppColors.background,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Shop for ₹999 more',
                    style: GoogleFonts.poppins(
                      color: AppColors.background.withOpacity(0.7),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),

          // Right side: Offers Tag (Yellow/Orange)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.amber.shade400, // Placeholder for the offers tag color
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              'Offers',
              style: GoogleFonts.poppins(
                color: AppColors.kDarkText,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
