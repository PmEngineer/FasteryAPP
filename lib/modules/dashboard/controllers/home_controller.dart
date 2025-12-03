import 'package:get/get.dart';
import '../../../core/helpers/location_helper.dart';
import '../../../data/models/address_model.dart';
import '../../../data/services/address_service.dart';
import '../models/dashboard_section_model.dart';

class HomeController extends GetxController {
  final dashboardSections = <DashboardSection>[].obs;

  final locationText = 'Fetching location...'.obs;

  final AddressService addressService = AddressService();

  @override
  void onInit() {
    super.onInit();
    fetchDashboardData();
    fetchUserLocationAddress();
  }

  void fetchDashboardData() async {
    await Future.delayed(const Duration(milliseconds: 300));
    dashboardSections.assignAll(mockSections);
  }

  // ---------------- GET CURRENT LOCATION + CALL API ---------------- //
  void fetchUserLocationAddress() async {
    final position = await LocationHelper.getCurrentLocation();

    if (position == null) {
      locationText.value = "Location permission denied";
      return;
    }

    double lat = position.latitude;
    double lng = position.longitude;

    print("Current Latitude: $lat");
    print("Current Longitude: $lng");

    final result = await addressService.fetchAddress(lat: lat, lng: lng);

    if (result != null) {
      locationText.value = result.address;
    } else {
      locationText.value = "Location not found";
    }
  }

  void onSearchTapped() {
    print("Search Tapped");
  }

  void onLocationTapped() {
    fetchUserLocationAddress(); // refresh manually
  }
}
