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
    return Column(
      children: [
        Divider(height: 1, thickness: 1, color: kGreyShade),
        TextButton(
          style: TextButton.styleFrom(overlayColor: kGrey,
            iconColor: kGrey,
            foregroundColor: kGrey,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          ),
          onPressed: onTap,
          child: SizedBox(
            width: double.infinity,
            child: Row(
              children: [Icon(icon), const SizedBox(width: 15), Text(title)],
            ),
          ),
        ),
      ],
    );
  }
}
