import 'dart:convert';
import 'package:http/http.dart' as http;

class NewsApiService {
  final String apiKey = '79413acd113e47afa6df664fc33850e7';
  final String apiUrl = 'https://newsapi.org/v2/top-headlines?country=us&apiKey=';

  Future<List<dynamic>> fetchTopHeadlines() async {
    final response = await http.get(Uri.parse('$apiUrl$apiKey'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data['articles'];
    } else {
      throw Exception('Failed to load news articles');
    }
  }
}
