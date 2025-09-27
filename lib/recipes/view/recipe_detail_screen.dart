import 'package:admin_mobile/recipes/model/recipe_model.dart';
import 'package:admin_mobile/recipes/view/recipe_edit_screen.dart';
import 'package:flutter/material.dart';

class RecipeDetailScreen extends StatefulWidget {
  final Recipe recipe;

  const RecipeDetailScreen({super.key, required this.recipe});

  @override
  State<RecipeDetailScreen> createState() => _RecipeDetailScreenState();
}

class _RecipeDetailScreenState extends State<RecipeDetailScreen> {
  late Recipe recipe;

  @override
  void initState() {
    super.initState();
    recipe = widget.recipe;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.name, style: TextStyle(fontWeight: FontWeight.bold)),
        titleSpacing: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
              icon: Image.asset(
                "assets/icons/recipe/list.png",
                width: 28,
                height: 28,
              ),
              onPressed: () async {
                final updated = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => RecipeEditScreen(recipe: recipe),
                  ),
                );
                if (updated != null) {
                  setState(() => recipe = updated);
                }
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(right: 16, left: 16, bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Nguyên liệu:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            ...recipe.ingredients.map((ing) {
              final name = ing["name"] ?? "";
              final qty = ing["quantity"] ?? "";
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Text("- $name : $qty", style: TextStyle(fontSize: 16)),
              );
            }).toList(),

            const SizedBox(height: 20),

            const Text(
              "Hướng dẫn:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            ...recipe.instructions.asMap().entries.map((entry) {
              final index = entry.key + 1;
              final step = entry.value;
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Text(
                  "Bước $index: $step",
                  style: TextStyle(fontSize: 16),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
