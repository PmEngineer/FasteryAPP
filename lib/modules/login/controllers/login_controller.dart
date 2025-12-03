import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/app_utilities.dart'; // Import utility for SnackBar

class LoginController extends GetxController {
  LoginController();

  // State for the mobile number input
  final mobileNumberController = TextEditingController();

  // Reactive state for button enabling/disabling
  final isButtonEnabled = false.obs;

  // Simple validation: enable button if input is 8 characters or more
  void onMobileNumberChanged(String value) {
    // Remove all non-numeric characters for simple length check
    final cleanedNumber = value.replaceAll(RegExp(r'\D'), '');
    isButtonEnabled.value = cleanedNumber.length >= 8;
  }

  // Function to call when GET OTP button is pressed
  void getOtp() async {
    final mobileNumber = mobileNumberController.text;

    if (mobileNumber.isEmpty) {
      AppUtilities.showErrorSnackBar(
        'Input Required',
        'Please enter your mobile number.',
      );
      return;
    }

    try {
      // Show loading indicator (optional: use a loading.obs variable)
      // Get.dialog(const Center(child: CircularProgressIndicator()));

      // Simulate API call to request OTP
      // await _userRepository.requestOtp(mobileNumber);
      await Future.delayed(const Duration(seconds: 1)); // Mock delay

      // Close loading indicator
      // Get.back();

      AppUtilities.showErrorSnackBar('Success', 'OTP sent to $mobileNumber!');

      // Navigate to OTP verification screen (if one existed)
      // Get.toNamed(Routes.OTP_VERIFICATION);
    } catch (e) {
      // Handle API errors
      // Get.back(); // Close loading indicator
      AppUtilities.showErrorSnackBar('OTP Request Failed', e.toString());
    }
  }

  @override
  void onClose() {
    mobileNumberController.dispose();
    super.onClose();
  }
}
