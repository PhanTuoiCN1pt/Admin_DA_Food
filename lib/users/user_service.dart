import 'dart:convert';

import 'package:admin_mobile/users/user_model.dart';
import 'package:http/http.dart' as http;

class UserService {
  static const String baseUrl = "http://192.168.0.106:5000/api/users";

  /// Lấy tất cả người dùng
  Future<List<UserModel>> getAllUsers() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((e) => UserModel.fromJson(e)).toList();
    } else {
      throw Exception("Failed to fetch users");
    }
  }

  /// Lấy user theo id
  Future<UserModel> getUserById(String id) async {
    final response = await http.get(Uri.parse("$baseUrl/$id"));

    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 404) {
      throw Exception("User not found");
    } else {
      throw Exception("Failed to fetch user");
    }
  }

  /// Cập nhật user
  Future<UserModel> updateUser(String id, UserModel user) async {
    final response = await http.put(
      Uri.parse("$baseUrl/$id"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 404) {
      throw Exception("User not found");
    } else {
      throw Exception("Failed to update user");
    }
  }

  /// Xóa user
  Future<void> deleteUser(String id) async {
    final response = await http.delete(Uri.parse("$baseUrl/$id"));

    if (response.statusCode == 200) {
      return;
    } else if (response.statusCode == 404) {
      throw Exception("User not found");
    } else {
      throw Exception("Failed to delete user");
    }
  }

  /// Tạo user mới (nếu cần)
  Future<UserModel> createUser(UserModel user) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode == 201) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to create user");
    }
  }
}
