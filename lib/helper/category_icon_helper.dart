class CategoryIconHelper {
  static String getIcon(String category) {
    switch (category) {
      case "Thịt gà":
        return "assets/icons/recipe/christmas-dinner.png";
      case "Thịt lợn":
        return "assets/icons/recipe/pork-roast.png";
      case "Thịt bò":
        return "assets/icons/recipe/steak.png";
      case "Thịt vịt":
        return "assets/icons/recipe/meat.png";
      case "Tôm":
        return "assets/icons/recipe/shrimp.png";
      case "Hải sản":
        return "assets/icons/recipe/lobster.png";
      case "Cá":
        return "assets/icons/recipe/seafood.png";
      default:
        return "assets/icons/recipe/cooking.png";
    }
  }
}
