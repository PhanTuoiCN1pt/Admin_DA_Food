import 'package:flutter/material.dart';

import '../service/dashboard_service.dart';

class DashboardHome extends StatefulWidget {
  const DashboardHome({super.key});

  @override
  State<DashboardHome> createState() => _DashboardHomeState();
}

class _DashboardHomeState extends State<DashboardHome> {
  final service = DashboardService();
  late Future<Map<String, int>> statsFuture;

  @override
  void initState() {
    super.initState();
    statsFuture = _loadStats();
  }

  Future<Map<String, int>> _loadStats() async {
    final results = await Future.wait([
      service.getUserCount(),
      service.getFoodCount(),
      service.getRecipeCount(),
    ]);

    return {
      "Người dùng": results[0],
      "Thực phẩm": results[1],
      "Món ăn": results[2],
    };
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, int>>(
      future: statsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text("Lỗi: ${snapshot.error}"));
        } else if (!snapshot.hasData) {
          return const Center(child: Text("Không có dữ liệu"));
        }

        final stats = snapshot.data!;
        final colors = [Colors.blue, Colors.green, Colors.purple];

        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "Thống kê",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),

              // 3 ô chia đều chiều ngang
              Row(
                children: List.generate(stats.length, (index) {
                  final key = stats.keys.elementAt(index);
                  final value = stats.values.elementAt(index);

                  return Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: colors[index % colors.length],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Text(
                            "$value",
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            key,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        );
      },
    );
  }
}
