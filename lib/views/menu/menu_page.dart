import 'package:flutter/material.dart';
import 'package:pharmacy/constants/constants.dart';
import 'package:pharmacy/views/menu/categories_tab.dart';
import 'package:pharmacy/views/menu/pharmacies_tab.dart';

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
                child: TabBarView(children: [CategoriesTab(), PharmaciesTab()]),
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
        icon: Icon(Icons.close, color: kGrey),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }

  Container _buildTabBar() {
    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: kGreyLight)),
      ),

      child: const TabBar(
        indicatorColor: kPrimary,
        indicatorSize: TabBarIndicatorSize.tab,
        labelColor: kPrimary,
        labelStyle: const TextStyle(fontWeight: FontWeight.w600),
        unselectedLabelColor: kGrey,
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
        tabs: [
          Tab(text: "Bölümler"),
          Tab(text: "Dermanhanalar"),
        ],
      ),
    );
  }
}
