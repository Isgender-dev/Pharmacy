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
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: Icon(Icons.close, color: kGray),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),

              Container(
                decoration: BoxDecoration(
                  border: Border(top: BorderSide(color: kGrayLight)),
                ),

                child: TabBar(
                  indicatorColor: kPrimary,
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelColor: kPrimary,
                  labelStyle: TextStyle(fontWeight: FontWeight.w600),
                  unselectedLabelColor: kGray,
                  unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
                  tabs: [
                    Tab(text: "Bölümler"),
                    Tab(text: "Sahypalar"),
                  ],
                ),
              ),

              Expanded(
                child: TabBarView(
                  children: [
                    _categories(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _categories extends StatelessWidget {
  const _categories();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Expanded(
                child: FloatingActionButton(
                  onPressed: () {},
                  foregroundColor: kPrimary,
                  backgroundColor: kPrimaryLight,
                  child: Icon(Icons.add),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}