import 'package:flutter/material.dart';
import 'package:pharmacy/constants/constants.dart';
import 'package:pharmacy/services/auth_service.dart';
import 'package:pharmacy/views/profile/profile.dart';

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
          const SizedBox(height: 10),
          Text(
            "Hasabyňyza giriň",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              color: kDark,
              letterSpacing: -0.5,
            ),
          ),
          FooterSection(mainAxisAlignment: MainAxisAlignment.start),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

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
        _label("E-poçta"),
        _inputField(
          emailController,
          Icons.mail_outline_rounded,
          "mysal@gmail.com",
        ),

        const SizedBox(height: 24),

        _label("Açar söz"),
        _inputField(
          passwordController,
          Icons.lock_outline_rounded,
          "********",
          isPassword: true,
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

  Widget _inputField(
    TextEditingController controller,
    IconData icon,
    String hint, {
    bool isPassword = false,
    Widget? suffix,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        decoration: BoxDecoration(
          color: kWhite,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: kDark),
        ),
        child: TextField(
          controller: controller,
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
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginButton({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shadowColor: kTransparent,
            backgroundColor: kDark,
            foregroundColor: kWhite,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 0,
          ),
          onPressed: () async {
            try {
              final response = await AuthService().login(
                email: emailController.text.trim(),
                password: passwordController.text,
              );

              print(response.data);
              if (!context.mounted) return;
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Profile()),
              );
            } catch (e) {
              if (!context.mounted) return;
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(e.toString()),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          child: const Text(
            "Giriş",
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          const SizedBox(height: 30.0),
          Row(
            children: [
              Expanded(child: Divider(color: kGrayShade, thickness: 1)),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "Ýa-da şunuň bilen dowam ediň",
                  style: TextStyle(color: kGray, fontSize: 14),
                ),
              ),

              Expanded(child: Divider(color: kGrayShade, thickness: 1)),
            ],
          ),

          const SizedBox(height: 30.0),

          _socialButton(
            text: "Google arkaly giriş",
            imageUrl: "https://cdn-icons-png.flaticon.com/512/300/300221.png",
            backgroundColor: kWhite,
            textColor: kGray,
            borderColor: kGrayShade,
          ),

          const SizedBox(height: 14),

          _socialButton(
            text: "Facebook arkaly giriş",
            imageUrl: "https://cdn-icons-png.flaticon.com/512/733/733547.png",
            backgroundColor: kBlue,
            textColor: kWhite,
            borderColor: kBlue,
          ),

          const SizedBox(height: 14),

          _socialButton(
            text: "Github arkaly giriş",
            imageUrl: "https://img.icons8.com/ios-filled/100/FFFFFF/github.png",
            backgroundColor: kDark,
            textColor: kWhite,
            borderColor: kDark,
          ),

          SizedBox(height: 14),
          FooterSection(mainAxisAlignment: MainAxisAlignment.center),
        ],
      ),
    );
  }

  Widget _socialButton({
    required String text,
    required String imageUrl,
    required Color backgroundColor,
    required Color textColor,
    required Color borderColor,
    VoidCallback? onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 42,
      child: ElevatedButton(
        onPressed: onPressed ?? () {},
        style: ElevatedButton.styleFrom(
          shadowColor: kTransparent,
          elevation: 0,
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
            side: BorderSide(color: borderColor),
          ),
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(imageUrl, height: 22, width: 22),

            const SizedBox(width: 10),

            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.w600,
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
  const FooterSection({super.key, required this.mainAxisAlignment});
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Text("Hasabyňyz ýokmy?", style: TextStyle(color: kGray)),
        Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: GestureDetector(
            onTap: () {},
            // onDoubleTap: () {
            //   print('click 2');
            // },
            // onLongPress: () {
            //   showDialog(
            //     context: context,
            //     builder: (context) {
            //       return AlertDialog(title: Text('Hello'));
            //     },
            //   );
            // },
            child: Text(
              "Agza boluň",
              style: TextStyle(color: kDark, fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ],
    );
  }
}
