import 'package:get/get.dart';
import '../constants/app_constants.dart';

class ApiCall extends GetConnect {
  ApiCall() {
    httpClient.baseUrl = AppConstants.baseUrl;
    httpClient.timeout = AppConstants.timeout;
  }

  // ====================== GET REQUEST ====================== //
  Future<Response> getRequest(String endpoint, {Map<String, dynamic>? query}) async {
    final uri = Uri.parse("${AppConstants.baseUrl}$endpoint")
        .replace(queryParameters: query);

    print("------- GET REQUEST -------");
    print("URI      : $uri");
    print("RAW BODY : null");
    print("----------------------------");

    final response = await get(endpoint, query: query);

    print("------- GET RESPONSE -------");
    print("Status  : ${response.statusCode}");
    print("Body    : ${response.body}");
    print("------------------------------");

    if (!response.isOk) {
      throw Exception("API Failed: ${response.statusCode} - ${response.statusText}");
    }

    return response;
  }

  // ====================== POST REQUEST ====================== //
  Future<Response> postRequest(String endpoint, dynamic body,
      {Map<String, dynamic>? query}) async {
    final uri = Uri.parse("${AppConstants.baseUrl}$endpoint")
        .replace(queryParameters: query);

    print("------- POST REQUEST -------");
    print("URI      : $uri");
    print("RAW BODY : $body");
    print("-----------------------------");

    final response = await post(endpoint, body, query: query);

    print("------- POST RESPONSE -------");
    print("Status  : ${response.statusCode}");
    print("Body    : ${response.body}");
    print("-------------------------------");

    if (!response.isOk) {
      throw Exception("API Failed: ${response.statusCode} - ${response.statusText}");
    }

    return response;
  }
}
