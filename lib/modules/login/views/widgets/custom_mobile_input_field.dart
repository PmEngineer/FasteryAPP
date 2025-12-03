import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/app_colors.dart';

class CustomMobileInputField extends StatelessWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final String hintText;

  const CustomMobileInputField({
    super.key,
    this.controller,
    this.onChanged,
    this.hintText = '+91 - 56789112', // Default hint
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.phone,
        // textAlign: TextAlign.center,
        style: GoogleFonts.poppins(
          fontSize: 15,
          // fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: GoogleFonts.poppins(
            color: Colors.grey.shade400, // Lighter hint color
            // fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
          // --- BOX STYLING ---
          filled: true,
          fillColor: Colors.grey.shade100, // Light background for the box
          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      
          // Normal/Enabled state border
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0), // Rounded corners for the box
            borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
          ),
      
          // Focused state border (when user taps on it)
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: AppColors.primaryRed, width: 2), // Highlight color
          ),
      
          // Default border (for error state or general styling if not using filled)
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
          ),
          // --- END BOX STYLING ---
        ),
        onChanged: onChanged,
      ),
    );
  }
}