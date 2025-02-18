import 'package:credilio/core/models/api_response.dart';
import 'package:credilio/file_exporter.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static final ApiService instance = ApiService._();
  static const String _apiKey = "b822655370e94ae4b2d0b5c7eab54904";
  static const String _baseUrl = "https://newsapi.org/v2/everything";
  ApiService._();

  Future<ApiResponse?> getNews() async {
    try {
      final url = Uri.parse(
          "$_baseUrl?q=tesla&from=2025-01-18&sortBy=publishedAt&apiKey=$_apiKey");
      final response = await http.get(url);
      if (response.statusCode == 200) {
        // print(response.body)
        final jsonBody = json.decode(response.body);
        if (jsonBody != null && jsonBody is Map<String, dynamic>) {
          return ApiResponse.fromJson(jsonBody);
        } else {
          throw Exception("Invalid JSON response");
        }
      } else {
        throw Exception('Failed to load news');
      }
    } catch (e) {
      return null;
    }
  }
}
