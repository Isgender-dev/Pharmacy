import 'package:flutter/material.dart';
import 'package:pharmacy/constants/constants.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Menýu'), backgroundColor: kPrimaryLight, foregroundColor: kPrimary, centerTitle: true,),
      body: Center(child: Text('Menýu sahypasy'),),
    );
  }
}