import 'package:flutter/material.dart';
import 'package:pharmacy/constants/constants.dart';

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;

  const MenuItem({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: kGrey),
      title: Text(title),
      onTap: onTap,
    );
  }
}
