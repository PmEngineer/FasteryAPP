import 'package:get/get.dart';
import '../../../data/models/service_model.dart'; // Import the model

class ServiceController extends GetxController {
  // Observables
  final services = <ServiceModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Load mock data for demonstration
    _fetchServices();
  }

  // Simulate fetching data
  void _fetchServices() {
    // In a real app, you'd call an API here.
    // We are using mock data for this example.
    services.value = mockServices;
  }

  void onServiceTap(ServiceModel service) {
    // Navigate to the service details or booking page
    Get.toNamed(service.route, arguments: service);
    print('Tapped on service: ${service.title}, navigating to ${service.route}');
  }
}