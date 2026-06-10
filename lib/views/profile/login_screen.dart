import 'package:flutter/material.dart';
import 'package:pharmacy/views/profile/login.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const LoginHeader(),

              LoginFormFields(
                emailController: emailController,
                passwordController: passwordController,
                isPasswordVisible: isPasswordVisible,
                onTogglePassword: () {
                  setState(() => isPasswordVisible = !isPasswordVisible);
                },
              ),

              LoginButton(
                emailController: emailController,
                passwordController: passwordController,
              ),

              const SocialLoginSection(),
            ],
          ),
        ),
      ),
    );
  }
}