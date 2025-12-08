import 'package:fastery/modules/category/bindings/category_binding.dart';
import 'package:fastery/modules/profile/bindings/profile_binding.dart';
import 'package:get/get.dart';
import '../../dashboard/bindings/home_binding.dart';
import '../views/main_wrapper.dart';

class MainWrapperBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController());

    HomeBinding().dependencies();
    ProfileBinding().dependencies();
    CategoryBinding().dependencies();

  }
}