import 'package:flutter/material.dart';
import 'package:pharmacy/constants/constants.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 70),
          Text(
            "Sign in to your account",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: kDark,
              letterSpacing: -0.5,
            ),
          ),
          Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text("Don't have an account?", style: TextStyle(color: kGray)),
        TextButton(
          onPressed: () {},
          child: Text(
            "Sign Up",
            style: TextStyle(color: kDark, fontWeight: FontWeight.w800),
          ),
        ),
      ],
    ),
          
        ],
      ),
    );
  }
}

class LoginFormFields extends StatelessWidget {
  final bool isPasswordVisible;
  const LoginFormFields({super.key, required this.isPasswordVisible});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _label("Email"),
        _inputFiled(Icons.mail_outline_rounded, "example@gmail.com"),
        const SizedBox(height: 24),
        _label("Password"),
        _inputFiled(
          Icons.lock_outline_rounded,
          "********",
          isPassword: true,
          suffix: IconButton(
            onPressed: () {},
            icon: Icon(
              isPasswordVisible
                  ? Icons.visibility_rounded
                  : Icons.visibility_off_outlined,
              size: 20,
              color: kDark,
            ),
          ),
        ),

        SizedBox(height: 10.0),

        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: TextButton(
            onPressed: () {},
            child: Text(
              "Forgot password?",
              style: TextStyle(fontWeight: FontWeight.w800, color: kDark),
            ),
          ),
        ),

        const SizedBox(height: 20.0),
      ],
    );
  }

  Widget _label(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, bottom: 5),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: kGray,
          letterSpacing: 1.2,
        ),
      ),
    );
  }

  Widget _inputFiled(
    IconData icon,
    String hint, {
    bool isPassword = false,
    Widget? suffix,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        // ignore: sort_child_properties_last
        child: TextField(
          cursorColor: kPrimary,
          obscureText: isPassword && !isPasswordVisible,
          style: TextStyle(color: kDark),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: kGrayLight, fontSize: 15),
            prefixIcon: Icon(icon, color: kPrimary, size: 22),
            suffixIcon: suffix,
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(vertical: 18),
          ),
        ),
        decoration: BoxDecoration(
          color: kWhite,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: kDark),
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SizedBox(
        width: double.infinity,
        height: 60,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDark,
            foregroundColor: kWhite,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 0,
          ),
          onPressed: () {},
          child: const Text(
            "Login",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}

class SocialLoginSection extends StatelessWidget {
  const SocialLoginSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text("Or continue with", style: TextStyle(color: kGray)),
        ),

        const SizedBox(height: 24.0),
      ],
    );
  }

  Widget _tile(String label, String? imgUrl, {IconData? icon}) {
    return Expanded(
      child: Container(
        height: 58,
        decoration: BoxDecoration(
          color: kWhite,
          border: Border.all(color: kRed),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (imgUrl != null)
              Image.network(imgUrl, height: 18)
            else
              Icon(icon, size: 22, color: kDark),
            const SizedBox(width: 12),
            Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: kDark,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have an account?", style: TextStyle(color: kGray)),
        TextButton(
          onPressed: () {},
          child: Text(
            "Sign Up",
            style: TextStyle(color: kDark, fontWeight: FontWeight.w800),
          ),
        ),
      ],
    );
  }
}
