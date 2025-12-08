import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/routes/app_routes.dart';
import '../../../data/repositories/user_repository.dart';

class LoginController extends GetxController {
  final UserRepository _userRepository;

  LoginController(this._userRepository);

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
  // LoginController
  void getOtp() async {
    final mobileNumber = mobileNumberController.text;

    if (mobileNumber.isEmpty) {
      // Show error message
      return;
    }

    try {
      // 1. Simulate API call to request OTP
      // Mock delay

      // 2. Navigate to OTP verification screen AFTER successful call
      // This is where you wanted the navigation to happen
      Get.toNamed(Routes.OTP); // <--- ADD THIS HERE

      // Optional: Show success message here
      // AppUtilities.showErrorSnackBar('Success', 'OTP sent to $mobileNumber!');

    } catch (e) {
      // Handle API errors
      // AppUtilities.showErrorSnackBar('OTP Request Failed', e.toString());
    }
  }

  @override
  void onClose() {
    mobileNumberController.dispose();
    super.onClose();
  }
}