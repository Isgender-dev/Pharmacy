import 'package:flutter/material.dart';
import 'package:pharmacy/constants/constants.dart';
import 'package:pharmacy/core/token_storage.dart';
import 'package:pharmacy/services/category_service.dart';
import 'package:pharmacy/views/menu/menu_item.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              _buildCloseButton(context),
              _buildTabBar(),
              Expanded(
                child: TabBarView(children: [_categoriesTab(), _pagesTab()]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Align _buildCloseButton(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: IconButton(
        icon: Icon(Icons.close, color: kGray),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }

  Container _buildTabBar() {
    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: kGrayLight)),
      ),

      child: const TabBar(
        indicatorColor: kPrimary,
        indicatorSize: TabBarIndicatorSize.tab,
        labelColor: kPrimary,
        labelStyle: const TextStyle(fontWeight: FontWeight.w600),
        unselectedLabelColor: kGray,
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
        tabs: [
          Tab(text: "Bölümler"),
          Tab(text: "Sahypalar"),
        ],
      ),
    );
  }
}

class _categoriesTab extends StatefulWidget {
  const _categoriesTab();

  @override
  State<_categoriesTab> createState() => _categoriesTabState();
}

class _categoriesTabState extends State<_categoriesTab> {
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

class _pagesTab extends StatelessWidget {
  const _pagesTab();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          MenuItem(icon: Icons.card_giftcard, title: "Teklipler", onTap: () {}),
          MenuItem(icon: Icons.flash_on, title: "Ýyldyrym satuw", onTap: () {}),
          MenuItem(
            icon: Icons.shopping_bag_outlined,
            title: "Töleg",
            onTap: () {},
          ),
          MenuItem(
            icon: Icons.help_outline,
            title: "Kömek (FAQ)",
            onTap: () {},
          ),
          MenuItem(
            icon: Icons.people_outline,
            title: "Biz barada",
            onTap: () {},
          ),
          MenuItem(
            icon: Icons.phone_outlined,
            title: "Habarlaşmak",
            onTap: () {},
          ),
          MenuItem(
            icon: Icons.privacy_tip_outlined,
            title: "Gizlinlik syýasaty",
            onTap: () {},
          ),
          MenuItem(
            icon: Icons.sentiment_dissatisfied,
            title: "Paroly unutdym",
            onTap: () {},
          ),
          MenuItem(
            icon: Icons.description_outlined,
            title: "Düzgünler we şertler",
            onTap: () {},
          ),
          MenuItem(icon: Icons.error_outline, title: "Tapylmady", onTap: () {}),
        ],
      ),
    );
  }
}
