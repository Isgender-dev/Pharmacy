import 'package:flutter/material.dart';
import 'package:pharmacy/constants/constants.dart';
import 'package:pharmacy/core/token_storage.dart';
import 'package:pharmacy/services/category_service.dart';
import 'package:pharmacy/views/menu/menu_item.dart';

class CategoriesTab extends StatefulWidget {
  CategoriesTab({super.key});
  
  @override
  State<CategoriesTab> createState() => _categoriesTabState();
}

class _categoriesTabState extends State<CategoriesTab> {
  List<dynamic> categories = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadCategories();
  }

  Future<void> loadCategories() async {
    print("TOKEN: ${TokenStorage.token}");

    try {
      final response = await CategoryService().getCategories();

      print("RESPONSE: ${response.data}");

      setState(() {
        categories = response.data['data'] ?? [];
        isLoading = false;
      });
    } catch (e, st) {
      print('TYPE: ${e.runtimeType}');
      print('StackTrace: $st');
      print('ERROR: $e');

      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator(color: kPrimary));
    }

    if (categories.isEmpty) {
      return const Center(child: Text("Bölümler entek ýok"));
    }

    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];

        return MenuItem(
          icon: Icons.category,
          title: category['name'] ?? '',
          onTap: () {},
        );
      },
    );
  }
}
