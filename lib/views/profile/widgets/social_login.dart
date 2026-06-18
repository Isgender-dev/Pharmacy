
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pharmacy/constants/constants.dart';
import 'package:pharmacy/views/profile/widgets/footer_section.dart';

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
          FooterSection(text: "Hasabyňyz ýokmy?", textButton: "Agza boluň",mainAxisAlignment: MainAxisAlignment.start,),
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
