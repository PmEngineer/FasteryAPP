import 'package:fastery/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/routes/app_routes.dart';
import '../controllers/login_controller.dart';
import 'widgets/custom_mobile_input_field.dart';


class LoginVerificationView extends GetView<LoginController> {
  const LoginVerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 200,
                child: Image.asset(
                  'assets/images/login.png',
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
                'Mobile Verification',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),

              const SizedBox(height: 12),

              // --- 3. Subtitle/Instruction ---
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'We will send you an One Time Password on this mobile number',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // --- 4. Mobile Number Input Field (Updated) ---
              CustomMobileInputField(
                controller: controller.mobileNumberController,
                onChanged: controller.onMobileNumberChanged,
              ),

              const SizedBox(height: 40),

              // --- 5. GET OTP Button ---
              Obx(() => CustomButton(
                text: "GET OTP",
                onPressed: controller.isButtonEnabled.value
                    ? controller.getOtp
                    : () {
                  Get.toNamed(Routes.OTP);
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}