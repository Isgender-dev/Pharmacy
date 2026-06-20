import 'package:flutter/material.dart';
import 'package:pharmacy/constants/constants.dart';

class FooterSection extends StatelessWidget {
  FooterSection({
    super.key,
    required this.text,
    required this.textButton,
    required this.onTap,
  });
  
  final String text;
  final String textButton;
  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(text, style: TextStyle(color: kGrey)),
        Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: GestureDetector(
            onTap: onTap,
            child: Text(
              textButton,
              style: TextStyle(color: kDark, fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ],
    );
  }
}
