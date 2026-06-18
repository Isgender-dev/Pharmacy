import 'package:flutter/material.dart';
import 'package:pharmacy/constants/constants.dart';
import 'package:pharmacy/views/profile/widgets/input_fields.dart';
import 'package:pharmacy/views/profile/widgets/label.dart';

class LoginFormFields extends StatelessWidget {
  final bool isPasswordVisible;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback onTogglePassword;
  const LoginFormFields({
    super.key,
    required this.isPasswordVisible,
    required this.emailController,
    required this.passwordController,
    required this.onTogglePassword,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Label(text: "E-poçta"),
        InputField(
          controller: emailController,
          icon: Icons.mail_outline_rounded,
          hint: "mysal@gmail.com",
        ),

        const SizedBox(height: 24),

        Label(text: "Açar söz"),
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

        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: GestureDetector(
            onTap: () {},
            child: Text(
              "Açar sözüňizi unutdyňyzmy?",
              style: TextStyle(fontWeight: FontWeight.w700, color: kDark),
            ),
          ),
        ),

        const SizedBox(height: 20.0),
      ],
    );
  }
}
