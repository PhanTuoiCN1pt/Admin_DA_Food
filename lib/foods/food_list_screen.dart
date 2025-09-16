import 'package:flutter/material.dart';

import 'category_model.dart';
import 'food_edit_screen.dart';
import 'food_service.dart';

class FoodListScreen extends StatefulWidget {
  final String categoryId;
  const FoodListScreen({super.key, required this.categoryId});

  @override
  State<FoodListScreen> createState() => _FoodListScreenState();
}

class _FoodListScreenState extends State<FoodListScreen> {
  final foodService = FoodService();
  late Future<Category> categoryFuture;

  @override
  void initState() {
    super.initState();
    _reloadCategory();
  }

  void _reloadCategory() {
    setState(() {
      categoryFuture = foodService.getCategoryById(widget.categoryId);
    });
  }

  // 👉 Thêm subCategory
  Future<void> _addSubCategory() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => FoodEditScreen(categoryId: widget.categoryId),
      ),
    );

    if (result != null && result is Map<String, dynamic>) {
      final sub = SubCategory(
        id: "",
        label: result["label"],
        icon: result["icon"],
      );
      await foodService.addSubCategory(widget.categoryId, sub);
      _reloadCategory();
    }
  }

  Future<void> _editSubCategory(SubCategory sub) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => FoodEditScreen(
          categoryId: widget.categoryId,
          subId: sub.id,
          initLabel: sub.label,
          initIcon: sub.icon,
        ),
      ),
    );

    if (result != null && result is Map<String, dynamic>) {
      final updated = SubCategory(
        id: sub.id,
        label: result["label"],
        icon: result["icon"],
      );
      await foodService.updateSubCategory(widget.categoryId, sub.id, updated);
      _reloadCategory();
    }
  }

  Future<void> _deleteSubCategory(String subId) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Xóa thực phẩm"),
        content: const Text("Bạn có chắc muốn xóa thực phẩm này không?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text("Hủy"),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text("Xóa"),
          ),
        ],
      ),
    );

    if (confirm == true) {
      await foodService.deleteSubCategory(widget.categoryId, subId);
      _reloadCategory();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Chi tiết thực phẩm",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        titleSpacing: 0,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: IconButton(
              icon: Image.asset(
                "assets/icons/icon_app/add.png",
                width: 30,
                height: 30,
              ),
              onPressed: _addSubCategory,
            ),
          ),
        ],
      ),
      body: FutureBuilder<Category>(
        future: categoryFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData) {
            return const Center(child: Text("Không tìm thấy thực phẩm"));
          }

          final category = snapshot.data!;
          return ListView.separated(
            itemCount: category.subCategories.length,
            separatorBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(left: 16.0, right: 16),
              child: const Divider(thickness: 1, color: Colors.grey, height: 1),
            ),
            itemBuilder: (context, index) {
              final sub = category.subCategories[index];
              return ListTile(
                leading: sub.icon.isNotEmpty
                    ? Image.asset(sub.icon, width: 32, height: 32)
                    : const Icon(Icons.arrow_right),
                title: Text(sub.label),
                trailing: PopupMenuButton<String>(
                  onSelected: (value) {
                    if (value == "edit") {
                      _editSubCategory(sub);
                    } else if (value == "delete") {
                      _deleteSubCategory(sub.id);
                    }
                  },
                  itemBuilder: (_) => const [
                    PopupMenuItem(value: "edit", child: Text("Sửa")),
                    PopupMenuItem(value: "delete", child: Text("Xóa")),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
