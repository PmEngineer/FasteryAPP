import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

// Assuming AppColors is in '../core/constants/app_colors.dart'
// If running this code, you may need to adjust the import path for AppColors
import '../../../../core/constants/app_colors.dart';

class RateOrderView extends StatelessWidget {
  const RateOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    // Set system bar colors to match the app (white background, dark icons)
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: AppColors.background, // Match the app bar color
    ));

    return Scaffold(
      backgroundColor: AppColors.background,
      // Custom AppBar for the back button and title area
      appBar: AppBar(
        automaticallyImplyLeading: false, // Use a custom leading icon
        title: Text(
          "How was your order?",
          style: GoogleFonts.poppins(
            color: AppColors.kDarkText,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: false,
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.kDarkText),
          onPressed: () => Navigator.of(context).pop(), // Placeholder action
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // --- Rate Delivery Experience Section ---
                  const DeliveryRatingCard(),
                  const SizedBox(height: 24),

                  // --- Rate Products Section Title ---
                  Text(
                    "Tell us more about the products",
                    style: GoogleFonts.poppins(
                      color: AppColors.kDarkText,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // --- Product Rating List ---
                  const ProductRatingCard(
                    productName: "Bail Kolhu ...",
                    imageUrl: "assets/images/bail_kolhu.png", // Placeholder image path
                  ),
                  const SizedBox(height: 8),
                  const ProductRatingCard(
                    productName: "Bitter Gourd",
                    imageUrl: "assets/images/bitter_gourd.png", // Placeholder image path
                  ),
                  const SizedBox(height: 8),
                  const ProductRatingCard(
                    productName: "Fortune Refi...",
                    imageUrl: "assets/images/fortune_refi.png", // Placeholder image path
                  ),
                  const SizedBox(height: 24),

                  // --- Any Other Feedback Section ---
                  Text(
                    "Any other feedback?",
                    style: GoogleFonts.poppins(
                      color: AppColors.kDarkText,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const FeedbackTextField(),
                ],
              ),
            ),
          ),
          // --- Fixed Bottom Submit Button ---
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: SubmitButton(),
          ),
        ],
      ),
    );
  }
}

// --- Reusable Star Rating Widget ---
class StarRatingRow extends StatelessWidget {
  final int initialRating;
  final ValueChanged<int>? onRatingChanged;

  const StarRatingRow({
    super.key,
    this.initialRating = 0, // Default to 0 stars
    this.onRatingChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        final isFilled = index < initialRating;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2.0),
          child: GestureDetector(
            onTap: () => onRatingChanged?.call(index + 1),
            child: Icon(
              Icons.star,
              size: 22,
              // Stars are greyed out in the image (indicating unrated state or 0/5)
              color: isFilled ? Colors.amber : AppColors.inactiveIndicator,
            ),
          ),
        );
      }),
    );
  }
}

// --- Delivery Rating Card Widget ---
class DeliveryRatingCard extends StatelessWidget {
  const DeliveryRatingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left: Icon and Text
          Row(
            children: [
              // Placeholder for the Z logo icon
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: AppColors.lightGrey,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      const Icon(Icons.shopping_bag_outlined, color: Colors.orange, size: 24),
                      Positioned(
                        top: 4,
                        right: 4,
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: const BoxDecoration(
                            color: AppColors.kPrimaryGreen,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.check, color: Colors.white, size: 8),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Rate delivery experience",
                    style: GoogleFonts.poppins(
                      color: AppColors.kDarkText,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const StarRatingRow(),
                ],
              ),
            ],
          ),

        ],
      ),
    );
  }
}

// --- Product Rating Card Widget ---
class ProductRatingCard extends StatelessWidget {
  final String productName;
  final String imageUrl;

  const ProductRatingCard({
    super.key,
    required this.productName,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.lightGrey, width: 1), // Optional light border for separation
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left: Product Image and Name
          Row(
            children: [
              // Placeholder for the product image
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.lightGrey,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                  // Using an icon as a placeholder for the product image
                  child: Text(
                    productName.substring(0, 1),
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      color: AppColors.kHintText,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                productName,
                style: GoogleFonts.poppins(
                  color: AppColors.kDarkText,
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
          // Right: Rating Stars (unrated in screenshot)
          const StarRatingRow(
            initialRating: 0,
            // onRatingChanged: (rating) => print('Rated $productName: $rating'),
          ),
        ],
      ),
    );
  }
}

// --- Feedback Text Field Widget ---
class FeedbackTextField extends StatelessWidget {
  const FeedbackTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.lightGrey, width: 1),
      ),
      child: TextField(
        maxLines: 5,
        decoration: InputDecoration(
          hintText: "Write your suggestions or reviews here...",
          hintStyle: GoogleFonts.poppins(
            color: AppColors.kHintText,
            fontSize: 14,
          ),
          border: InputBorder.none,
          isDense: true,
          contentPadding: EdgeInsets.zero,
        ),
        style: GoogleFonts.poppins(
          color: AppColors.kDarkText,
          fontSize: 14,
        ),
      ),
    );
  }
}

// --- Submit Button Widget ---
class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          // Placeholder for submit action
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.lightGrey, // Grey button in the screenshot
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          "Submit",
          style: GoogleFonts.poppins(
            color: AppColors.kDarkText,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}