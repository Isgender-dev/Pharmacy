import 'package:flutter/material.dart';
import 'package:pharmacy/common/custom_container.dart';
import 'package:pharmacy/constants/constants.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sebet'),
        backgroundColor: kPrimaryLight,
        foregroundColor: kPrimary,
        centerTitle: true,
      ),
      body: 
      // SafeArea(child: CustomContainer(containerContent: 
      // Container(),
      Center(child: Text('Sebet sahypasy'))
      // ),
      // ),
    );
  }
}
