import 'package:fastery/modules/all_items/bindings/all_items_binding.dart';
import 'package:fastery/modules/all_items/views/all_items_view.dart';
import 'package:fastery/modules/category/bindings/category_binding.dart';
import 'package:fastery/modules/category/view/category_view.dart';
import 'package:fastery/modules/location_selection/bindings/location_selection_binding.dart';
import 'package:fastery/modules/location_selection/views/location_selection_view.dart';
import 'package:fastery/modules/main_wrapper/views/main_wrapper.dart';
import 'package:fastery/modules/login/bindings/login_binding.dart';
import 'package:fastery/modules/login/views/login_verification_view.dart';
import 'package:fastery/modules/otp/bindings/otp_binding.dart';
import 'package:fastery/modules/otp/views/otp_verification_view.dart';
import 'package:fastery/modules/service/bindings/service_binding.dart';
import 'package:fastery/modules/service/views/service_view.dart';
import 'package:get/get.dart';
import '../../modules/dashboard/bindings/home_binding.dart';
import '../../modules/dashboard/view/home_view/home_view.dart';
import '../../modules/main_wrapper/bindings/main_wrapper_binding.dart';
import '../../modules/profile/bindings/profile_binding.dart';
import '../../modules/shop/bindings/shop_details_binding.dart';
import '../../modules/shop/views/shop_details_view.dart';
import 'app_routes.dart';
import 'package:fastery/modules/splash_screen/views/splash_screen.dart';
import 'package:fastery/modules/splash_screen/bindings/splash_binding.dart';
import 'package:fastery/modules/profile/views/profile_view.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashScreen(),
      binding: SplashBinding(), // Dependency injection for the Splash Controller
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginVerificationView(),
      binding: LoginBinding(), // Dependency injection for the Splash Controller
    ),
    GetPage(
      name: Routes.OTP,
      page: () => const OtpVerificationView(),
      binding: OtpBinding(), // Dependency injection for the Splash Controller
    ),
    GetPage(
      name: Routes.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.MAIN_WRAPPER,
      page: () => MainWrapper(),
      binding: MainWrapperBinding(),
    ),
    GetPage(
      name: Routes.LOCATION_SELECTION,
      page: () => const LocationSelectionView(),
      binding: LocationSelectionBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: Routes.SERVICES,
      page: () => const ServiceView(),
      binding: ServiceBinding(),
    ),
    GetPage(
      name: Routes.CATEGORY,
      page: () => CategoryView(),
      binding: CategoryBinding(),
    ),
    GetPage(
      name: Routes.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: Routes.SHOPDETAILS,
      page: () => const ShopDetailsView(),
      binding: HomeBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: Routes.ALLITEMS,
      page: () => const AllItemsView(),
      binding: AllItemsBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
  ];
}

