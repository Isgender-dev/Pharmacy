import 'package:flutter/material.dart';
import 'package:pharmacy/constants/constants.dart';

class DashboardCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color iconBg;
  final Color iconColor;

  const DashboardCard({
    required this.icon,
    required this.title,
    required this.iconBg,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: kGreyShade),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: iconBg,
            child: Icon(icon, color: iconColor),
          ),
          const SizedBox(width: 15),
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
