import 'package:get/get.dart';
import '../controllers/home_controller.dart';
// Note: We don't need UserRepository here, so we skip the import.

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}