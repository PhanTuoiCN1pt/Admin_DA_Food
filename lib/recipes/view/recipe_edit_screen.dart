import 'package:admin_mobile/recipes/model/recipe_model.dart';
import 'package:admin_mobile/recipes/service/recipe_service.dart';
import 'package:flutter/material.dart';

class RecipeEditScreen extends StatefulWidget {
  final Recipe recipe;

  const RecipeEditScreen({super.key, required this.recipe});

  @override
  State<RecipeEditScreen> createState() => _RecipeEditScreenState();
}

class _RecipeEditScreenState extends State<RecipeEditScreen> {
  final _formKey = GlobalKey<FormState>();
  final service = RecipeService();

  late TextEditingController _nameController;
  late List<TextEditingController> _ingredientNameControllers;
  late List<TextEditingController> _ingredientQuantityControllers;
  late List<TextEditingController> _instructionControllers;
  late TextEditingController _categoryController;
  late TextEditingController _subCategoryController;

  @override
  void initState() {
    super.initState();

    _nameController = TextEditingController(text: widget.recipe.name);

    _ingredientNameControllers = widget.recipe.ingredients
        .map((ing) => TextEditingController(text: ing["name"].toString()))
        .toList();

    _ingredientQuantityControllers = widget.recipe.ingredients
        .map((ing) => TextEditingController(text: ing["quantity"].toString()))
        .toList();

    _instructionControllers = widget.recipe.instructions
        .map((step) => TextEditingController(text: step))
        .toList();

    _categoryController = TextEditingController(text: widget.recipe.category);

    _subCategoryController = TextEditingController(
      text: widget.recipe.subCategory,
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    for (var c in _ingredientNameControllers) c.dispose();
    for (var c in _ingredientQuantityControllers) c.dispose();
    for (var c in _instructionControllers) c.dispose();
    _categoryController.dispose();
    super.dispose();
  }

  void _saveRecipe() async {
    if (!_formKey.currentState!.validate()) return;

    final updated = Recipe(
      id: widget.recipe.id,
      name: _nameController.text.trim(),
      ingredients: List.generate(_ingredientNameControllers.length, (i) {
        return {
          "name": _ingredientNameControllers[i].text.trim(),
          "quantity": _ingredientQuantityControllers[i].text.trim(),
        };
      }),
      instructions: _instructionControllers.map((c) => c.text.trim()).toList(),
      category: _categoryController.text.trim(),
      subCategory: "",
    );

    try {
      await service.updateRecipe(updated.id, updated);
      if (!mounted) return;
      Navigator.pop(context, updated); // trả về recipe đã sửa
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Lỗi khi cập nhật: $e")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Chỉnh sửa món ăn",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        titleSpacing: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
              icon: Image.asset(
                "assets/icons/icon_app/save.png",
                width: 28,
                height: 28,
              ),
              onPressed: _saveRecipe,
            ),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // 🔹 Tên món ăn
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: "Tên món",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              validator: (value) =>
                  value == null || value.isEmpty ? "Nhập tên món ăn" : null,
            ),
            const SizedBox(height: 20),

            // 🔹 Category
            TextFormField(
              controller: _categoryController,
              decoration: InputDecoration(
                labelText: "Nguyên liệu chính",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              validator: (value) =>
                  value == null || value.isEmpty ? "Nhập category" : null,
            ),
            const SizedBox(height: 20),

            // SubCategory
            TextFormField(
              controller: _subCategoryController,
              decoration: InputDecoration(
                labelText: "Phương pháp nấu",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              validator: (value) =>
                  value == null || value.isEmpty ? "Nhập subCategory" : null,
            ),
            const SizedBox(height: 20),

            // 🔹 Nguyên liệu
            const Text(
              "Nguyên liệu:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ..._ingredientNameControllers.asMap().entries.map((entry) {
              final index = entry.key;
              return Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _ingredientNameControllers[index],
                      decoration: const InputDecoration(
                        labelText: "Tên nguyên liệu",
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextFormField(
                      controller: _ingredientQuantityControllers[index],
                      decoration: const InputDecoration(labelText: "Số lượng"),
                    ),
                  ),
                  IconButton(
                    icon: Image.asset(
                      "assets/icons/icon_app/delete.png",
                      width: 28,
                      height: 28,
                    ),
                    onPressed: () {
                      setState(() {
                        _ingredientNameControllers.removeAt(index).dispose();
                        _ingredientQuantityControllers
                            .removeAt(index)
                            .dispose();
                      });
                    },
                  ),
                ],
              );
            }),
            TextButton.icon(
              icon: const Icon(Icons.add),
              label: const Text("Thêm nguyên liệu"),
              onPressed: () {
                setState(() {
                  _ingredientNameControllers.add(TextEditingController());
                  _ingredientQuantityControllers.add(TextEditingController());
                });
              },
            ),
            const SizedBox(height: 20),

            // 🔹 Hướng dẫn
            const Text(
              "Hướng dẫn:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ..._instructionControllers.asMap().entries.map((entry) {
              final index = entry.key;
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _instructionControllers[index],
                      decoration: InputDecoration(
                        labelText: "Bước ${index + 1}",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: IconButton(
                      icon: Image.asset(
                        "assets/icons/icon_app/delete.png",
                        width: 28,
                        height: 28,
                      ),
                      onPressed: () {
                        setState(() {
                          _instructionControllers.removeAt(index).dispose();
                        });
                      },
                    ),
                  ),
                ],
              );
            }),
            TextButton.icon(
              icon: const Icon(Icons.add),
              label: const Text("Thêm bước"),
              onPressed: () {
                setState(() {
                  _instructionControllers.add(TextEditingController());
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
