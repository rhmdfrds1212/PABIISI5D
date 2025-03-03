import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "https://api.themoviedb.org/3";
  static const apiKey = "cde511d322e979b23da1e05722cd53d5";

  Future<List<Map<String, dynamic>>> getAllMovies() async{
    final response = await http.get(Uri.parse("$baseUrl/movie/now_playing?api_key=$apiKey"));

    final data = json.decode(response.body);

    return List<Map<String, dynamic>>.from(data['results']);
  }
  Future<List<Map<String, dynamic>>> getTrendingMovies() async{
    final response = await http.get(Uri.parse("$baseUrl/movie/popular?api_key=$apiKey"));
  
    final data = json.decode(response.body);

    return List<Map<String, dynamic>>.from(data['results']); 
  }
}