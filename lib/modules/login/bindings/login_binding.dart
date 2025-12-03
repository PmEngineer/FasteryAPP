import 'package:get/get.dart';
import '../../../data/repositories/user_repository.dart';
import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    if (!Get.isRegistered<UserRepository>()) {
      Get.lazyPut<UserRepository>(() => UserRepository());
    }
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
