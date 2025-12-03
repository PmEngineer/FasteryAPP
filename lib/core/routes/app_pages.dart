import 'package:fastery/modules/login/bindings/login_binding.dart';
import 'package:fastery/modules/login/views/login_verification_view.dart';
import 'package:fastery/modules/otp/bindings/otp_binding.dart';
import 'package:fastery/modules/otp/views/otp_verification_view.dart';
import 'package:get/get.dart';
import '../../modules/dashboard/bindings/home_binding.dart';
import '../../modules/dashboard/view/home_view/home_view.dart';
import '../../modules/profile/bindings/profile_binding.dart';
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
      name: Routes.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    )
  ];
}

