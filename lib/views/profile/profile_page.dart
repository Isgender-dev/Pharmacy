import 'package:flutter/material.dart';
import 'package:pharmacy/constants/constants.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profil'), backgroundColor: kPrimaryLight, foregroundColor: kPrimary, centerTitle: true,),
      body: Center(child: Text('Profil sahypasy'),),
    );
  }
}