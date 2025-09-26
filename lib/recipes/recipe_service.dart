import 'dart:convert';

import 'package:admin_mobile/recipes/recipe_model.dart';
import 'package:http/http.dart' as http;

import '../connect/api_url.dart';

class RecipeService {
  final String baseUrl = "$apiUrl/admin/recipes"; // Android Emulator

  Future<List<Recipe>> getAllRecipes() async {
    final res = await http.get(Uri.parse("$baseUrl/all"));
    if (res.statusCode == 200) {
      final List data = jsonDecode(res.body)["recipes"];
      return data.map((e) => Recipe.fromJson(e)).toList();
    } else {
      throw Exception("Lỗi load recipes: ${res.body}");
    }
  }

  Future<Recipe> getRecipeById(String id) async {
    final res = await http.get(Uri.parse("$baseUrl/$id"));
    if (res.statusCode == 200) {
      return Recipe.fromJson(jsonDecode(res.body));
    } else {
      throw Exception("Lỗi load recipe: ${res.body}");
    }
  }

  Future<Recipe> createRecipe(Recipe recipe) async {
    final res = await http.post(
      Uri.parse(baseUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(recipe.toJson()),
    );
    if (res.statusCode == 201) {
      return Recipe.fromJson(jsonDecode(res.body));
    } else {
      throw Exception("Lỗi tạo recipe: ${res.body}");
    }
  }

  Future<Recipe> updateRecipe(String id, Recipe recipe) async {
    final res = await http.put(
      Uri.parse("$baseUrl/$id"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(recipe.toJson()),
    );
    if (res.statusCode == 200) {
      return Recipe.fromJson(jsonDecode(res.body));
    } else {
      throw Exception("Lỗi update recipe: ${res.body}");
    }
  }

  Future<void> deleteRecipe(String id) async {
    final res = await http.delete(Uri.parse("$baseUrl/$id"));
    if (res.statusCode != 200) {
      throw Exception("Lỗi xóa recipe: ${res.body}");
    }
  }
}
