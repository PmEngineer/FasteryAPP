import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/routes/app_routes.dart';
import '../../../core/widgets/custom_button.dart';
import '../controllers/otp_verification_controller.dart';
import 'widgets/otp_test_field_widget.dart';

class OtpVerificationView extends GetView<OtpController> {
  const OtpVerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<FocusNode> otpFocusNodes = List.generate(4, (_) => FocusNode());
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textDark),
          onPressed: () => Get.back(),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // --- 1. Illustration Placeholder (Updated with hearts) ---
              SizedBox(
                height: 200,
                child: Image.asset(
                  'assets/images/otp.png',
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 200,
                    alignment: Alignment.center,
                    color: Colors.grey.shade100,
                    child: const Text('Illustration Placeholder'),
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // --- 2. Title ---
              Text(
                'OTP Verification',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textDark,
                ),
              ),

              const SizedBox(height: 12),

              // --- 3. Subtitle/Instruction ---
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  // Assume the mobile number is passed in or stored in controller
                  'Enter OTP sent to +51 - 56789112',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: AppColors.textGrey,
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // --- 4. OTP Input Fields ---
              Obx(
                    () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(4, (index) {
                    return OtpTextField(
                      controller: controller.otp[index],
                      focusNode: otpFocusNodes[index],
                      nextFocusNode: index < 3 ? otpFocusNodes[index + 1] : null,
                      onChanged: (value) {
                        // Handle deletion/backspace manually for better UX
                        if (value.isEmpty && index > 0) {
                          FocusScope.of(context).requestFocus(otpFocusNodes[index - 1]);
                        }
                        controller.onOtpChanged(index, value);
                      },
                    );
                  }),
                ),
              ),

              const SizedBox(height: 30),

              // --- 5. Resend OTP Section ---
              Obx(
                    () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't receive the OTP? ",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: AppColors.textGrey,
                      ),
                    ),
                    controller.isResendActive.value
                        ? InkWell(
                      onTap: controller.resendOtp,
                      child: Text(
                        'Resend OTP',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: AppColors.primaryRed,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.primaryRed,
                        ),
                      ),
                    )
                        : Text(
                      'Resend in ${controller.timerSeconds.value}s',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: AppColors.textDark,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 50),

              // --- 6. VERIFY & PROCEED Button ---
              Obx(
                    () => CustomButton(
                  text: 'VERIFY & PROCEED',
                  onPressed: controller.isOtpValid.value
                      ? controller.verifyAndProceed
                      : (){
                    Get.toNamed(Routes.HOME);
                  },
                  color: AppColors.primaryRed,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}