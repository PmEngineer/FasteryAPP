import 'package:get/get.dart';
import '../../../data/repositories/user_repository.dart';
import '../controllers/otp_verification_controller.dart';

class OtpBinding extends Bindings {
  @override
  void dependencies() {
    // Ensure UserRepository is registered globally (or here if only used in this module)
    if (!Get.isRegistered<UserRepository>()) {
      Get.lazyPut<UserRepository>(() => UserRepository());
    }

    Get.lazyPut<OtpController>(
          () => OtpController(Get.find<UserRepository>()),
    );
  }
}