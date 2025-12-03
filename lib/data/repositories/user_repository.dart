import '../providers/api_provider.dart';
import '../../core/constants/app_constants.dart';

class UserRepository {
  final ApiProvider _apiProvider = ApiProvider();

  Future<List<dynamic>> fetchUsers() async {
    try {
      // Calls the API provider with the specific endpoint
      final data = await _apiProvider.get(AppConstants.usersEndpoint);
      // Process data (e.g., map to a list of User models)
      return data;
    } catch (e) {
      // Re-throw the error to be handled by the Controller
      throw Exception('Failed to fetch users: $e');
    }
  }
}