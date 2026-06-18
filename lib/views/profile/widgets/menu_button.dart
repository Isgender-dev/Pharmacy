import 'package:flutter/material.dart';
import 'package:pharmacy/constants/constants.dart';

class MenuButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const MenuButton({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        iconColor: kGray,
        foregroundColor: kGray,
        side: BorderSide(color: kGray),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
      onPressed: onTap,
      child: SizedBox(
        width: double.infinity,
        child: Row(
          children: [Icon(icon), const SizedBox(width: 15), Text(title)],
        ),
      ),
    );
  }
}
