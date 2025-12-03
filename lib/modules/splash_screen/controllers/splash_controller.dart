import 'package:get/get.dart';
import '../../../core/utils/app_utilities.dart';
import '../../../data/repositories/user_repository.dart'; // Import the Repository
import '../../../core/routes/app_routes.dart'; // Import routes for navigation

class SplashController extends GetxController {
  // Dependency is injected via constructor (standard MVVM practice)
  final UserRepository _userRepository;

  SplashController(this._userRepository);

  @override
  void onReady() {
    super.onReady();
    // Start any necessary initial tasks
    _initializeApp();
  }

  void _initializeApp() async {
    // 1. Simulate API call to fetch initial data or config
    try {
      await Future.delayed(const Duration(seconds: 2)); // Show splash for 2 seconds

      final users = await _userRepository.fetchUsers();
      print('Initial data fetched: ${users.length} users');

      // 2. Navigate to the next screen using Get.offNamed
      Get.offNamed(Routes.HOME);

    } catch (e) {
      // Handle initialization error (e.g., show error dialog)
      print('Initialization failed: $e');
      // Use the utility for error feedback (Step 6)
      AppUtilities.showErrorSnackBar('Initialization Error', e.toString());
    }
  }
}