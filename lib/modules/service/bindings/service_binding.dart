import 'package:get/get.dart';
import '../controllers/service_controller.dart';

class ServiceBinding extends Bindings {
  @override
  void dependencies() {
    // Lazy put means the controller is initialized when the view is created
    Get.lazyPut<ServiceController>(
          () => ServiceController(),
    );
  }
}