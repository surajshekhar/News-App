import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
// Ensure keys.dart has proper definitions
import 'package:newstech/components/searchbar.dart';

Future<List> fetchnews() async {
  final apiKey = dotenv.env["APIKEY"];
  if (apiKey == null) {
    throw Exception("API key not found in environment variables");
  }

  final searchQuery = SearchBaring.searchcontroller.text.trim();
  final response = await http.get(
    Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&category=technology&pageSize=100&apiKey=$apiKey&q=$searchQuery'),
  );

  if (response.statusCode == 200) {
    Map result = jsonDecode(response.body);
    print('Fetched');
    return result['articles'];
  } else {
    throw Exception('Failed to load news');
  }
}
