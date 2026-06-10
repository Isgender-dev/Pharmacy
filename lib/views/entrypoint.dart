import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy/constants/constants.dart';
import 'package:pharmacy/controllers/tab_index_controller.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:pharmacy/views/cart/cart_page.dart';
import 'package:pharmacy/views/home/home_page.dart';
import 'package:pharmacy/views/menu/menu_page.dart';
import 'package:pharmacy/views/profile/profile_page.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final List<Widget> pageList = [HomePage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TabIndexController());

    return Obx(
      () => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          automaticallyImplyActions: false,
          backgroundColor: kPrimaryLight,
          title: _buildSearchBar(),
        ),
        drawer: const MenuPage(),
        endDrawer: const CartPage(),
        body: Stack(
          children: [
            pageList[controller.tabIndex],
            Align(
              alignment: Alignment.bottomCenter,
              child: Builder(
                builder: (context) {
                  return _buildBottomNavBar(context, controller);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavBar(
    BuildContext context,
    TabIndexController controller,
  ) {
    return BottomNavigationBar(
      backgroundColor: kPrimary,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: kSecondary,
      unselectedItemColor: kPrimaryLight,
      currentIndex: controller.tabIndex == 0 ? 1 : 3,
      onTap: (index) {
        switch (index) {
          case 0:
            Scaffold.of(context).openDrawer();
            break;

          case 1:
            controller.tabIndex = 0;
            break;

          case 2:
            Scaffold.of(context).openEndDrawer();
            break;

          case 3:
            controller.tabIndex = 1;
            break;
        }
      },
      items: [
        BottomNavigationBarItem(
          icon: const Icon(AntDesign.bars),
          label: 'Menýu',
        ),

        const BottomNavigationBarItem(
          icon: Icon(AntDesign.home),
          label: 'Baş sahypa',
        ),

        const BottomNavigationBarItem(
          icon: Badge(label: Text('1'), child: Icon(AntDesign.shoppingcart)),
          label: 'Sebet',
        ),

        const BottomNavigationBarItem(
          icon: Icon(AntDesign.user),
          label: 'Profil',
        ),
      ],
    );
  }
}

Container _buildSearchBar() {
  return Container(
    height: 40,
    decoration: BoxDecoration(
      color: kWhite,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Padding(
      padding: const EdgeInsets.only(left: 10),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Gözleg',
          hintStyle: TextStyle(color: kGray),
          suffixIcon: Icon(AntDesign.search1, color: kGray),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 10),
        ),
      ),
    ),
  );
}
