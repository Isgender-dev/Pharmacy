import 'package:flutter/material.dart';
import 'package:pharmacy/constants/constants.dart';
import 'package:pharmacy/views/profile/widgets/registration_button.dart';
import 'package:pharmacy/views/profile/widgets/registration_form_fields.dart';
import 'package:pharmacy/views/profile/widgets/registration_header.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final nameController = TextEditingController();
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
      body: ListView(
        children: [
          Column(
            children: [
              RegistrationHeader(),
              RegistrationFormFields(
                isPasswordVisible: isPasswordVisible,
                nameController: nameController,
                emailController: emailController,
                passwordController: passwordController,
                onTogglePassword: () {
                  setState(() => isPasswordVisible = !isPasswordVisible);
                },
              ),
              RegistrationButton(
                nameController: nameController,
                emailController: emailController,
                passwordController: passwordController,
              ),
              // SocialLoginSection(),
            ],
          ),
        ],
      ),
    );
  }
}
