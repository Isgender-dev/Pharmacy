import 'package:flutter/material.dart';
import 'package:pharmacy/constants/constants.dart';

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

      child: TabBar(
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

class _categoriesTab extends StatelessWidget {
  const _categoriesTab();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Expanded(
            child: FloatingActionButton(
              elevation: 1,
              onPressed: () {},
              foregroundColor: kPrimary,
              backgroundColor: kPrimaryLight,
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}

class _pagesTab extends StatelessWidget {
  const _pagesTab();

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Sahypalar'));
  }
}
