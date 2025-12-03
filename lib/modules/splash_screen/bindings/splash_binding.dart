import 'package:get/get.dart';
import '../../../data/repositories/user_repository.dart';
import '../controllers/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    // 1. Register the Repository as a dependency
    // Get.lazyPut<UserRepository>(() => UserRepository());

    // 2. Inject the Controller, passing the Repository to its constructor
    // Get.put<SplashController>(
    //   SplashController(Get.find<UserRepository>()),
    // );
  }
}