import 'package:admin_mobile/recipes/recipe_detail_screen.dart';
import 'package:admin_mobile/recipes/recipe_model.dart';
import 'package:admin_mobile/recipes/recipe_service.dart';
import 'package:flutter/material.dart';

import 'add_recipe_screen.dart';

class RecipeListScreen extends StatefulWidget {
  const RecipeListScreen({super.key});

  @override
  State<RecipeListScreen> createState() => _RecipeListScreenState();
}

class _RecipeListScreenState extends State<RecipeListScreen> {
  final service = RecipeService();
  late Future<List<Recipe>> recipesFuture;

  @override
  void initState() {
    super.initState();
    recipesFuture = service.getAllRecipes();
  }

  Future<void> addRecipe() async {
    final newRecipe = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const AddRecipeScreen()),
    );

    if (newRecipe != null && newRecipe is Recipe) {
      // Sau khi thêm xong, reload lại list
      setState(() {
        recipesFuture = service.getAllRecipes();
      });

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("✅ Thêm món ăn thành công")));
    }
  }

  void _deleteRecipe(String id) async {
    try {
      await service.deleteRecipe(id);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("✅ Xóa món ăn thành công")));
      setState(() {
        recipesFuture = service.getAllRecipes(); // reload lại list
      });
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("❌ Lỗi: $e")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          "Quản lý Món ăn",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: IconButton(
              icon: Image.asset(
                "assets/icons/icon_app/add.png",
                width: 30,
                height: 30,
              ),
              onPressed: addRecipe,
            ),
          ),
        ],
      ),
      body: FutureBuilder<List<Recipe>>(
        future: recipesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Lỗi: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("Không có món ăn"));
          }

          final recipes = snapshot.data!;
          return ListView.separated(
            padding: const EdgeInsets.all(12),
            itemCount: recipes.length,
            separatorBuilder: (_, __) => const SizedBox(height: 10),
            itemBuilder: (context, index) {
              final recipe = recipes[index];

              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 3,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.teal.shade100,
                    child: Image.asset(
                      "assets/icons/category/dinner.png",
                      width: 30,
                      height: 30,
                    ),
                  ),
                  title: Text(
                    recipe.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "Nguyên liệu: ${recipe.ingredients.length}",
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  trailing: IconButton(
                    icon: Image.asset(
                      "assets/icons/icon_app/garbage.png",
                      width: 30,
                      height: 30,
                    ),
                    onPressed: () => _deleteRecipe(recipe.id),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => RecipeDetailScreen(recipe: recipe),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
