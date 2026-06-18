import 'package:flutter/material.dart';
import 'package:pharmacy/constants/constants.dart';

class Label extends StatelessWidget {
  const Label({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
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
}
