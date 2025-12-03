import '../../core/constants/app_constants.dart';
import '../../core/network/api_call.dart';
import '../models/address_model.dart';

class AddressService {
  final ApiCall api = ApiCall();

  Future<AddressModel?> fetchAddress({
    required double lat,
    required double lng,
  }) async {

    final response = await api.getRequest(
      AppConstants.getAddress,
      query: {
        "lat": lat.toString(),
        "lng": lng.toString(),
      },
    );

    if (response.body == null) return null;

    return AddressModel.fromJson(response.body);
  }
}
