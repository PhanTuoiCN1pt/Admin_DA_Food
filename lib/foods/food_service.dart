// services/food_service.dart
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../connect/api_url.dart';
import 'category_model.dart';

class FoodService {
  final String baseUrl = "$apiUrl/api"; // đổi sang IP server của bạn

  // Lấy toàn bộ categories
  Future<List<Category>> getCategories() async {
    final url = Uri.parse("$baseUrl/categories");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((e) => Category.fromJson(e)).toList();
    } else {
      throw Exception("Lỗi khi lấy categories: ${response.body}");
    }
  }

  // Lấy 1 category theo id
  Future<Category> getCategoryById(String id) async {
    final url = Uri.parse("$baseUrl/categories/$id");
    final res = await http.get(url);

    if (res.statusCode == 200) {
      return Category.fromJson(jsonDecode(res.body));
    } else {
      throw Exception("Lỗi khi lấy category: ${res.body}");
    }
  }

  // Thêm subCategory
  Future<void> addSubCategory(
    String categoryId,
    SubCategory subCategory,
  ) async {
    final url = Uri.parse("$baseUrl/categories/$categoryId/subcategories");
    final res = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(subCategory.toJson()),
    );

    if (res.statusCode != 200) {
      throw Exception("Lỗi khi thêm subCategory: ${res.body}");
    }
  }

  // Sửa subCategory
  Future<void> updateSubCategory(
    String categoryId,
    String subId,
    SubCategory subCategory,
  ) async {
    final url = Uri.parse(
      "$baseUrl/categories/$categoryId/subcategories/$subId",
    );
    final res = await http.put(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(subCategory.toJson()),
    );

    if (res.statusCode != 200) {
      throw Exception("Lỗi khi cập nhật subCategory: ${res.body}");
    }
  }

  // Xóa subCategory
  Future<void> deleteSubCategory(String categoryId, String subId) async {
    final url = Uri.parse(
      "$baseUrl/categories/$categoryId/subcategories/$subId",
    );
    final res = await http.delete(url);

    if (res.statusCode != 200) {
      throw Exception("Lỗi khi xóa subCategory: ${res.body}");
    }
  }
}
