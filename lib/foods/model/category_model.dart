class SubCategory {
  final String id;
  final String icon;
  final String label;

  SubCategory({required this.id, required this.icon, required this.label});

  factory SubCategory.fromJson(Map<String, dynamic> json) {
    return SubCategory(
      id: json['_id'] ?? '',
      icon: json['icon'] ?? '',
      label: json['label'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'icon': icon, 'label': label};
  }
}

class Category {
  final String id;
  final String icon;
  final String label;
  final List<SubCategory> subCategories;

  Category({
    required this.id,
    required this.icon,
    required this.label,
    required this.subCategories,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['_id'] ?? '',
      icon: json['icon'] ?? '',
      label: json['label'] ?? '',
      subCategories: (json['subCategories'] as List<dynamic>? ?? [])
          .map((e) => SubCategory.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'icon': icon,
      'label': label,
      'subCategories': subCategories.map((e) => e.toJson()).toList(),
    };
  }
}
