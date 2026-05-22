import 'package:flutter/material.dart';
import 'package:pharmacy/constants/constants.dart';
import 'package:pharmacy/views/profile/login.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
        backgroundColor: const Color.fromRGBO(209, 250, 229, 1),
        foregroundColor: kPrimary,
        centerTitle: true,
      ),
      body: Column(
        children: [
          LoginHeader(), 
          LoginFormFields(isPasswordVisible: false,),
          LoginButton(),
          SocialLoginSection(),
          ],
      ),
    );
  }
}
