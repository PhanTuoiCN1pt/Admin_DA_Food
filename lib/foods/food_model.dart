class FoodModel {
  final String id;
  final String userId;
  final String name;
  final int quantity;
  final DateTime? expiryDate;
  final DateTime? registerDate;

  FoodModel({
    required this.id,
    required this.userId,
    required this.name,
    required this.quantity,
    this.expiryDate,
    this.registerDate,
  });

  factory FoodModel.fromJson(Map<String, dynamic> json) {
    return FoodModel(
      id: json['_id'] ?? '',
      userId: json['userId'] ?? '',
      name: json['name'] ?? '',
      quantity: json['quantity'] ?? '',
      expiryDate: json['expiryDate'] != null
          ? DateTime.tryParse(json['expiryDate'])
          : null,
      registerDate: json['registerDate'] != null
          ? DateTime.tryParse(json['registerDate'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "userId": userId,
      "name": name,
      "quantity": quantity,
      "expiryDate": expiryDate?.toIso8601String(),
      "registerDate": registerDate?.toIso8601String(),
    };
  }
}
