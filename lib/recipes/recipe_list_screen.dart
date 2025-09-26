import 'package:admin_mobile/recipes/recipe_detail_screen.dart';
import 'package:admin_mobile/recipes/recipe_model.dart';
import 'package:admin_mobile/recipes/recipe_service.dart';
import 'package:flutter/material.dart';

import '../helper/category_icon_helper.dart';
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
      setState(() {
        recipesFuture = service.getAllRecipes();
      });
    }
  }

  void _deleteRecipe(String id) async {
    try {
      await service.deleteRecipe(id);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Xóa món ăn thành công")));
      setState(() {
        recipesFuture = service.getAllRecipes();
      });
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Lỗi: $e")));
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
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
              icon: Image.asset(
                "assets/icons/icon_app/add.png",
                width: 28,
                height: 28,
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

          // ✅ Gom nhóm theo category (xử lý null)
          final Map<String, List<Recipe>> grouped = {};
          for (var recipe in recipes) {
            final category = recipe.category ?? "Khác";
            grouped.putIfAbsent(category, () => []);
            grouped[category]!.add(recipe);
          }

          return ListView(
            padding: const EdgeInsets.all(12),
            children: grouped.entries.map((entry) {
              final category = entry.key;
              final items = entry.value;

              // ✅ Gom nhóm theo subCategory
              final Map<String, List<Recipe>> subGrouped = {};
              for (var recipe in items) {
                final sub = recipe.subCategory ?? "Khác";
                subGrouped.putIfAbsent(sub, () => []);
                subGrouped[sub]!.add(recipe);
              }

              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 4,
                child: ExpansionTile(
                  leading: Image.asset(
                    CategoryIconHelper.getIcon(category ?? "Khác"),
                    width: 28,
                    height: 28,
                  ),
                  title: Text(
                    category,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  children: subGrouped.entries.map((subEntry) {
                    final subCategory = subEntry.key;
                    final subItems = subEntry.value;

                    return Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: ExpansionTile(
                        leading: Image.asset(
                          "assets/icons/recipe/cookingchef.png",
                          width: 28,
                          height: 28,
                        ),
                        title: Text(
                          subCategory,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        children: subItems.map((recipe) {
                          return ListTile(
                            leading: CircleAvatar(
                              // backgroundColor: Colors.teal.shade100,
                              child: Image.asset(
                                "assets/icons/category/dinner.png",
                                width: 28,
                                height: 28,
                              ),
                            ),
                            title: Text(
                              recipe.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            subtitle: Text(
                              "Nguyên liệu: ${recipe.ingredients.length}",
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                            trailing: IconButton(
                              icon: Image.asset(
                                "assets/icons/icon_app/garbage.png",
                                width: 26,
                                height: 26,
                              ),
                              onPressed: () => _deleteRecipe(recipe.id),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      RecipeDetailScreen(recipe: recipe),
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                    );
                  }).toList(),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
