// dashboard_service.dart
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../connect/api_url.dart';

class DashboardService {
  final String baseUrl = apiUrl; // ⚡ đổi sang server của bạn

  Future<int> getUserCount() async {
    final res = await http.get(Uri.parse("$baseUrl/api/users/all"));
    if (res.statusCode == 200) {
      final data = jsonDecode(res.body);
      return data.length; // giả sử API trả về List
    } else {
      throw Exception("Lỗi khi lấy user");
    }
  }

  Future<int> getFoodCount() async {
    final res = await http.get(Uri.parse("$baseUrl/api/foods/all"));
    if (res.statusCode == 200) {
      final data = jsonDecode(res.body);
      return data["totalSubCategories"];
    } else {
      throw Exception("Lỗi khi lấy subCategories");
    }
  }

  Future<int> getRecipeCount() async {
    final res = await http.get(Uri.parse("$baseUrl/admin/recipes/count"));
    if (res.statusCode == 200) {
      final data = jsonDecode(res.body);
      return data["totalRecipes"];
    } else {
      throw Exception("Lỗi khi lấy recipe");
    }
  }
}
