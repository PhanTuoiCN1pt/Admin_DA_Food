import 'package:flutter/material.dart';

import 'add_food_screen.dart';
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
  late Future<List<SubCategory>> subCategoryFuture;

  @override
  void initState() {
    super.initState();
    subCategoryFuture = foodService.getSubCategories(widget.categoryId);
  }

  void _reloadSubCategory() {
    setState(() {
      subCategoryFuture = foodService.getSubCategories(widget.categoryId);
    });
  }

  Future<void> _addSubCategory() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => AddFoodScreen(categoryId: widget.categoryId),
      ),
    );

    if (result != null && result is Map<String, dynamic>) {
      final sub = SubCategory(
        id: "",
        label: result["label"],
        icon: result["icon"],
      );
      await foodService.addSubCategory(widget.categoryId, sub);

      _reloadSubCategory();
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
      _reloadSubCategory();
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
      _reloadSubCategory();
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
            padding: const EdgeInsets.only(right: 20.0),
            child: IconButton(
              icon: Image.asset(
                "assets/icons/icon_app/add.png",
                width: 28,
                height: 28,
              ),
              onPressed: _addSubCategory,
            ),
          ),
        ],
      ),
      body: FutureBuilder<List<SubCategory>>(
        future: subCategoryFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("Không có thực phẩm"));
          }

          final subs = snapshot.data!;
          return ListView.separated(
            itemCount: subs.length,
            separatorBuilder: (context, index) => const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Divider(thickness: 1, color: Colors.grey, height: 1),
            ),
            itemBuilder: (context, index) {
              final sub = subs[index];
              return ListTile(
                leading: sub.icon.isNotEmpty
                    ? Image.asset(sub.icon, width: 32, height: 32)
                    : const Icon(Icons.fastfood),
                title: Text(sub.label),
                onTap: () => _editSubCategory(sub),
                trailing: IconButton(
                  icon: Image.asset(
                    "assets/icons/icon_app/garbage.png",
                    width: 26,
                    height: 26,
                  ),
                  onPressed: () => _deleteSubCategory(sub.id),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
