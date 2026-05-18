import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy/constants/constants.dart';
import 'package:pharmacy/controllers/tab_index_controller.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TabIndexController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimary,
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            color: kWhite,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: TextField(
              decoration: InputDecoration(
                hintText: '  Search for medicines',
                hintStyle: TextStyle(color: kGray),
                suffixIcon: Icon(Icons.search, color: kGray,),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 10),
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            // height: height,
            // width: width,
            color: kOffWhite,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Theme(
              data: Theme.of(context).copyWith(canvasColor: kPrimary),
              child: BottomNavigationBar(
                showSelectedLabels: false,
                showUnselectedLabels: false,
                selectedItemColor: kWhite,
                unselectedItemColor: kDarkWhite,
                onTap: (value) {},
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.menu_outlined),
                    label: 'Menu',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_cart_outlined),
                    label: 'Cart',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person_outline),
                    label: 'Profile',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
