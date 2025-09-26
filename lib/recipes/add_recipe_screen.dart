import 'package:flutter/material.dart';

import 'recipe_model.dart';
import 'recipe_service.dart';

class AddRecipeScreen extends StatefulWidget {
  const AddRecipeScreen({super.key});

  @override
  State<AddRecipeScreen> createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends State<AddRecipeScreen> {
  final _formKey = GlobalKey<FormState>();
  final service = RecipeService();

  final _nameController = TextEditingController();
  final _categoryController = TextEditingController();
  final _subCategoryController = TextEditingController();
  final List<TextEditingController> _ingredientNameControllers = [];
  final List<TextEditingController> _ingredientQuantityControllers = [];
  final List<TextEditingController> _instructionControllers = [];

  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _categoryController.dispose();
    _subCategoryController.dispose();
    for (var c in _ingredientNameControllers) c.dispose();
    for (var c in _ingredientQuantityControllers) c.dispose();
    for (var c in _instructionControllers) c.dispose();
    super.dispose();
  }

  Future<void> _saveRecipe() async {
    if (!_formKey.currentState!.validate()) return;

    final recipe = Recipe(
      id: "",
      name: _nameController.text.trim(),
      category: _categoryController.text.trim(),
      subCategory: _subCategoryController.text.trim(),
      ingredients: List.generate(_ingredientNameControllers.length, (i) {
        return {
          "name": _ingredientNameControllers[i].text.trim(),
          "quantity": _ingredientQuantityControllers[i].text.trim(),
        };
      }),
      instructions: _instructionControllers.map((c) => c.text.trim()).toList(),
      image: "",
    );

    setState(() => _isLoading = true);

    try {
      final created = await service.createRecipe(recipe);
      if (!mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("✅ Thêm recipe thành công")));
      Navigator.pop(context, created);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("❌ Lỗi khi thêm recipe: $e")));
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Thêm món ăn",
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
              onPressed: _isLoading ? null : _saveRecipe,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: "Tên món",
                    labelStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15), // bo góc 15
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    filled: true, // tô nền nhẹ
                    fillColor: Colors.grey[100], // màu nền nhẹ
                  ),
                  validator: (value) =>
                      value == null || value.isEmpty ? "Nhập tên món ăn" : null,
                ),
                const SizedBox(height: 20),

                // Category
                TextFormField(
                  controller: _categoryController,
                  decoration: InputDecoration(
                    labelText: "Nguyên liệu chính",
                    labelStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.grey[100],
                  ),
                  validator: (value) =>
                      value == null || value.isEmpty ? "Nhập danh mục" : null,
                ),
                const SizedBox(height: 20),

                // SubCategory
                TextFormField(
                  controller: _subCategoryController,
                  decoration: InputDecoration(
                    labelText: "Phương pháp nấu",
                    labelStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.grey[100],
                  ),
                  validator: (value) => value == null || value.isEmpty
                      ? "Nhập subCategory"
                      : null,
                ),

                SizedBox(height: 20),
                // Nguyên liệu
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
                          decoration: const InputDecoration(
                            labelText: "Số lượng",
                          ),
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
                            _ingredientNameControllers
                                .removeAt(index)
                                .dispose();
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
                      _ingredientQuantityControllers.add(
                        TextEditingController(),
                      );
                    });
                  },
                ),
                const SizedBox(height: 20),

                // Hướng dẫn
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
                      IconButton(
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
          if (_isLoading) const Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}
