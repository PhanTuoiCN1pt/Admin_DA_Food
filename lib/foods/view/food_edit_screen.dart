import 'package:flutter/material.dart';

class FoodEditScreen extends StatefulWidget {
  final String categoryId;
  final String? subId;
  final String? initLabel;
  final String? initIcon;

  const FoodEditScreen({
    super.key,
    required this.categoryId,
    this.subId,
    this.initLabel,
    this.initIcon,
  });

  @override
  State<FoodEditScreen> createState() => _SubCategoryEditScreenState();
}

class _SubCategoryEditScreenState extends State<FoodEditScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _labelController;
  String? _selectedIcon; // icon được chọn

  // Danh sách icon trong assets
  final List<String> _icons = ["assets/icons/category/food.png"];

  @override
  void initState() {
    super.initState();
    _labelController = TextEditingController(text: widget.initLabel ?? "");
    _selectedIcon = widget.initIcon;
  }

  @override
  void dispose() {
    _labelController.dispose();
    super.dispose();
  }

  void _save() {
    if (_formKey.currentState!.validate()) {
      Navigator.pop(context, {
        "label": _labelController.text.trim(),
        "icon": _selectedIcon, // icon path
        "subId": widget.subId,
      });
    }
  }

  void _pickIcon() async {
    await showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text("Chọn Icon"),
          content: SizedBox(
            width: double.maxFinite,
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: _icons.length,
              itemBuilder: (context, index) {
                final iconPath = _icons[index];
                return GestureDetector(
                  onTap: () {
                    setState(() => _selectedIcon = iconPath);
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: _selectedIcon == iconPath
                            ? Colors.blue
                            : Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.asset(iconPath),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.subId == null ? "Thêm thực phẩm" : "Sửa thực phẩm",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        titleSpacing: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
              onPressed: _save,
              icon: Image.asset(
                "assets/icons/icon_app/save.png",
                width: 26,
                height: 26,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _labelController,
                decoration: const InputDecoration(labelText: "Tên thực phẩm"),
                validator: (v) => v == null || v.isEmpty ? "Nhập tên" : null,
              ),
              const SizedBox(height: 16),

              // Hiển thị icon chọn
              Row(
                children: [
                  const Text("Icon:"),
                  const SizedBox(width: 16),
                  if (_selectedIcon != null)
                    Image.asset(_selectedIcon!, width: 40, height: 40),
                  const Spacer(),
                  ElevatedButton.icon(
                    onPressed: _pickIcon,
                    icon: const Icon(Icons.image),
                    label: const Text("Chọn Icon"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
