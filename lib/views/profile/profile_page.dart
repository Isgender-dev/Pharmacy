import 'package:flutter/material.dart';
import 'package:pharmacy/constants/constants.dart';
import 'package:pharmacy/views/profile/login.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isPasswordVisible = false;
   @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
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
          LoginFormFields(
            isPasswordVisible: isPasswordVisible,
            emailController: emailController,
            passwordController: passwordController,
          ),
          LoginButton(
            emailController: emailController,
            passwordController: passwordController,
          ),
          SocialLoginSection(),
        ],
      ),
    );
  }
}
