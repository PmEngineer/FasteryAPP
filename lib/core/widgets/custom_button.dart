import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color color;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    // Default the color to the primary theme color if not specified
    this.color = AppColors.primaryRed,
  });

  @override
  Widget build(BuildContext context) {
    // Determine the background color based on whether the button is enabled (onPressed is not null)
    final buttonColor = onPressed != null ? color : AppColors.disabledButton;

    return SizedBox(
      height: 50,
      child: ElevatedButton(
        // onPressed is directly passed. If it's null, the button is disabled.
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          // Set elevation to 0 as per the original design
          elevation: 0,
        ),
        child: Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            letterSpacing: 1.5,
          ),
        ),
      ),
    );
  }
}