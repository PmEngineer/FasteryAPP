// all_items_binding.dart

import 'package:get/get.dart';

import '../controllers/all_items_controller.dart';


class AllItemsBinding extends Bindings {
  @override
  void dependencies() {
    // Lazy put ensures the controller is created only when needed,
    // and is automatically disposed when no longer in use.
    Get.lazyPut<AllItemsController>(
          () => AllItemsController(),
    );
  }
}