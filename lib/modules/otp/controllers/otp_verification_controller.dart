
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import '../../../core/utils/app_utilities.dart';
import '../../../core/routes/app_routes.dart';
import '../../../data/repositories/user_repository.dart';

class OtpController extends GetxController {
  final UserRepository _userRepository;

  OtpController(this._userRepository);

  // Reactive State
  final otp = List.generate(4, (_) => TextEditingController()).obs;
  final isOtpValid = false.obs;
  final timerSeconds = 60.obs;
  final isResendActive = false.obs;

  late Timer _timer;

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  // --- Timer Logic ---
  void startTimer() {
    timerSeconds.value = 60;
    isResendActive.value = false;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timerSeconds.value > 0) {
        timerSeconds.value--;
      } else {
        timer.cancel();
        isResendActive.value = true;
      }
    });
  }

  void resendOtp() async {
    if (!isResendActive.value) return;

    // Optional: Add logic to display loading state

    try {
      // Simulate API call to resend OTP
      // await _userRepository.resendOtp();
      await Future.delayed(const Duration(seconds: 1));

      // AppUtilities.showErrorSnackBar('Success', 'New OTP sent!');
      startTimer(); // Restart the timer

    } catch (e) {
      // AppUtilities.showErrorSnackBar('Resend Failed', e.toString());
      isResendActive.value = true; // Ensure resend button is active on failure
    }
  }

  // --- Input Logic ---
  void onOtpChanged(int index, String value) {
    // Check if the overall OTP length is 4
    final currentOtp = otp.map((c) => c.text).join();
    isOtpValid.value = currentOtp.length == 4;
  }

  // OtpController

// --- Verification Logic ---
  void verifyAndProceed() async {
    final enteredOtp = otp.map((c) => c.text).join();

    if (enteredOtp.length != 4) {
      // AppUtilities.showErrorSnackBar('Validation Error', 'Please enter the full 4-digit OTP.');
      return;
    }

    isOtpValid.value = false; // Disable button while loading

    try {
      // Show loading indicator



      // Close loading indicator

      // --- Add Navigation Here ---
      Get.toNamed(Routes.MAIN_WRAPPER); // <--- ADD THIS HERE

    } catch (e) {
      // Handle API errors
      // AppUtilities.showErrorSnackBar('Verification Failed', 'Invalid OTP or network error.');
    } finally {
      isOtpValid.value = true; // Re-enable button
    }
  }

  @override
  void onClose() {
    _timer.cancel();
    for (var c in otp) {
      c.dispose();
    }
    super.onClose();
  }
}