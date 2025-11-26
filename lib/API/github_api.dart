//External
import 'dart:convert';
import 'package:http/http.dart' as http;
//Internal
import 'package:gh_search_app/Models/repository.dart';

class GithubApi {
  final baseUrl = 'https://api.github.com';

  Future<List<Repository>> searchRepositories(String query) async {
    final response = await http.get(
      Uri.parse('$baseUrl/search/repositories?q=$query'),
    );
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final items = json['items'] as List;
      return items.map((item) => Repository.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load repositories');
    }
  }
}