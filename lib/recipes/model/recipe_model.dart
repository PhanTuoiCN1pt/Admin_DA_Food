class Recipe {
  final String id;
  final String name;
  final List<dynamic> ingredients;
  final List<dynamic> instructions;
  final String? category;
  final String? subCategory;
  final String? location;
  final String? image;

  Recipe({
    required this.id,
    required this.name,
    required this.ingredients,
    required this.instructions,
    this.category,
    this.subCategory,
    this.location,
    this.image,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json["_id"],
      name: json["name"] ?? "",
      ingredients: (json["ingredients"] as List<dynamic>)
          .map(
            (e) => {
              "name": e["name"].toString(),
              "quantity": e["quantity"].toString(),
            },
          )
          .toList(),
      instructions: List<String>.from(json["instructions"] ?? []),
      category: json["category"],
      subCategory: json['subCategory'],
      image: json["image"] ?? "",
      location: json["location"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "ingredients": ingredients,
      "instructions": instructions,
      "category": category,
      "subCategory": subCategory,
      "location": location,
      "image": image,
    };
  }
}
