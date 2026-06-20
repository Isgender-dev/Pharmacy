import 'package:flutter/material.dart';
import 'package:pharmacy/constants/constants.dart';
import 'package:pharmacy/views/profile/widgets/input_fields.dart';
import 'package:pharmacy/views/profile/widgets/label.dart';

class RegistrationFormFields extends StatelessWidget {
  final bool isPasswordVisible;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback onTogglePassword;
  const RegistrationFormFields({
    super.key,
    required this.isPasswordVisible,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.onTogglePassword,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Label(text: " At we Familýa"),
        InputField(
          controller: nameController,
          icon: Icons.person_outline_outlined,
          hint: "Myrat Amanow",
        ),

        const SizedBox(height: 18),

        Label(text: " E-poçta"),
        InputField(
          controller: emailController,
          icon: Icons.mail_outline_rounded,
          hint: "myratamanow@gmail.com",
        ),

        const SizedBox(height: 18),

        Label(text: " Açar söz"),
        InputField(
          controller: passwordController,
          icon: Icons.lock_outline_rounded,
          hint: "********",
          isPassword: true,
          isPasswordVisible: isPasswordVisible,
          suffix: IconButton(
            onPressed: onTogglePassword,
            icon: Icon(
              isPasswordVisible
                  ? Icons.visibility_rounded
                  : Icons.visibility_off_outlined,
              size: 20,
              color: kDark,
            ),
          ),
        ),

        const SizedBox(height: 20.0),
      ],
    );
  }
}
