import 'package:flutter/material.dart';
import 'package:pharmacy/constants/constants.dart';
import 'package:pharmacy/views/profile/login.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
    return  
    Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
        backgroundColor: const Color.fromRGBO(209, 250, 229, 1),
        foregroundColor: kPrimary,
        centerTitle: true,
      ),
      body: ListView(
        children: [Column(
          children: [
            LoginHeader(),
            LoginFormFields(
              isPasswordVisible: isPasswordVisible,
              emailController: emailController,
              passwordController: passwordController,
              onTogglePassword: () {
                setState(() => isPasswordVisible = !isPasswordVisible);
              },
            ),
            LoginButton(
              emailController: emailController,
              passwordController: passwordController,
            ),
            SocialLoginSection(),
          ],
        ),
      ]),
    );
  }
}
