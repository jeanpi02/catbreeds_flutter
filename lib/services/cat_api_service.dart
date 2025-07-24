import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/cat_breed.dart';

class CatApiService {
  static const String baseUrl = 'https://api.thecatapi.com/v1';
  
  static Future<List<CatBreed>> getBreeds({
    int limit = 10,
    int page = 0,
  }) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/breeds?limit=$limit&page=$page'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => CatBreed.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load breeds: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching breeds: $e');
    }
  }


  static String getImageUrl(String? referenceImageId) {
    if (referenceImageId == null || referenceImageId.isEmpty) {
      return '';
    }
    return 'https://cdn2.thecatapi.com/images/$referenceImageId.jpg';
  }
} 