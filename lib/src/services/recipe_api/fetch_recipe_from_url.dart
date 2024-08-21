import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:recipe/src/constants/secrets.dart';

class FetchRecipe {
  static Future<List<Map<String, dynamic>>> getResponse(
      String findRecipe) async {
        // Get your own key and id from 'http://api.edamam.com'
    String id = RAppSecret.apiID;
    String key = RAppSecret.apiKey;
    String api =
        'http://api.edamam.com/search?q=$findRecipe&app_id=$id&app_key=$key';
    final response = await http.get(Uri.parse(api));
    List<Map<String, dynamic>> recipes = [];

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      if (data['hits'] != null) {
        for (var hit in data['hits']) {
          if (hit['recipe'] != null) {
            recipes.add(hit['recipe']);
          }
        }
      }
      return recipes;
    } else {
      throw Exception('Failed to load recipes');
    }
  }
}
