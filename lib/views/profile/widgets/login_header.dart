
import 'package:flutter/widgets.dart';
import 'package:pharmacy/constants/constants.dart';
import 'package:pharmacy/views/profile/widgets/footer_section.dart';

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
          FooterSection(text: "Hasabyňyz ýokmy?", textButton: "Agza boluň",mainAxisAlignment: MainAxisAlignment.start,),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}