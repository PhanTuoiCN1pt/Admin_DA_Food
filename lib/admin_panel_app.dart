import 'package:admin_mobile/foods/category_list_screen.dart';
import 'package:admin_mobile/notifications/notification_list_screen.dart';
import 'package:flutter/material.dart';

import 'dashboard/dashboard_screen.dart';
import 'recipes/recipe_list_screen.dart';
import 'users/user_list_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    DashboardHome(),
    UserListScreen(),
    CategoryListScreen(),
    RecipeListScreen(),
    NotificationListScreen(),
  ];

  void _onSelect(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tủ lạnh thông minh",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: Image.asset(
              "assets/icons/icon_app/logo_app.png",
              width: 65,
              height: 65,
            ),
          ),
        ],
      ),
      body: IndexedStack(index: _selectedIndex, children: _screens),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Admin",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  // Logo để dưới chữ Admin
                  Image(
                    image: AssetImage("assets/icons/icon_app/logo_app.png"),
                    width: 100,
                    height: 100,
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Image.asset(
                "assets/icons/icon_app/dashboard.png",
                width: 28,
                height: 28,
              ),
              title: const Text("Dashboard"),
              onTap: () => _onSelect(0),
            ),
            ListTile(
              leading: Image.asset(
                "assets/icons/icon_app/personal-information.png",
                width: 28,
                height: 28,
              ),
              title: const Text("Quản lý Người dùng"),
              onTap: () => _onSelect(1),
            ),
            ListTile(
              leading: Image.asset(
                "assets/icons/category/diet.png",
                width: 28,
                height: 28,
              ),
              title: const Text("Quản lý Thực phẩm"),
              onTap: () => _onSelect(2),
            ),
            ListTile(
              leading: Image.asset(
                "assets/icons/icon_app/cooking.png",
                width: 28,
                height: 28,
              ),
              title: const Text("Quản lý Món ăn"),
              onTap: () => _onSelect(3),
            ),
          ],
        ),
      ),
    );
  }
}
