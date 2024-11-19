// services/register_service.dart
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Api/Api_Model.dart';

class ApiServiceLaliga {
  final String baseUrl = 'https://thesportsdb.com/api/v1/json/3';

  Future<List<ApiModel>> fetchPosts() async {
    final response = await http.get(Uri.parse('$baseUrl/search_all_teams.php?l=Spanish%20La%20Liga'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      List data = jsonResponse['teams'];
      return data.map((json) => ApiModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}