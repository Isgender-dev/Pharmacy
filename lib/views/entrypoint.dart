// ignore_for_file: must_be_immutable

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

  List<Widget> pageList = [
    MenuPage(),
    HomePage(),
    CartPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TabIndexController());

    return Obx(
      () => Scaffold(
        drawer: const MenuPage(),
        // endDrawer: const CartPage(),
        body: Stack(
          children: [
            pageList[controller.tabIndex],
            Align(
              alignment: Alignment.bottomCenter,
              child: Theme(
                data: Theme.of(context).copyWith(canvasColor: kPrimary),
                child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  selectedItemColor: kSecondary,
                  unselectedItemColor: kWhite,
                  onTap: (value) {
                    controller.SetTabIndex = value;
                  },
                  currentIndex: controller.tabIndex,
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
                      icon: Badge(
                        label: Text('1'),
                        child: Icon(AntDesign.shoppingcart),
                      ),
                      label: 'Sebet',
                    ),

                    const BottomNavigationBarItem(
                      icon: Icon(AntDesign.user),
                      label: 'Profil',
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
