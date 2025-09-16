import 'package:admin_mobile/users/user_model.dart';
import 'package:admin_mobile/users/user_service.dart';
import 'package:flutter/material.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  final userService = UserService();
  late Future<List<UserModel>> _futureUsers;

  @override
  void initState() {
    super.initState();
    _futureUsers = userService.getAllUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<UserModel>>(
        future: _futureUsers,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("Không có người dùng"));
          }

          final users = snapshot.data!;
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final u = users[index];
              return ListTile(
                leading: Image.asset(
                  "assets/icons/icon_app/resume.png",
                  width: 30,
                  height: 30,
                ),
                title: Text(u.name),
                subtitle: Text(u.email),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Image.asset(
                        "assets/icons/icon_app/unfollow.png",
                        width: 30,
                        height: 30,
                      ),
                      onPressed: () async {
                        await userService.deleteUser(u.id);
                        setState(() {
                          _futureUsers = userService.getAllUsers();
                        });
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
