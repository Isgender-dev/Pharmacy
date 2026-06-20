import 'package:flutter/material.dart';
import 'package:pharmacy/constants/constants.dart';

class InputField extends StatefulWidget {
  final TextEditingController controller;
  final IconData icon;
  final String hint;
  final bool isPassword;
  final Widget? suffix;
  final bool isPasswordVisible;

  const InputField({
    super.key,
    required this.controller,
    required this.icon,
    required this.hint,
    this.isPassword = false,
    this.suffix,
    this.isPasswordVisible = false,
  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        decoration: BoxDecoration(
          color: kWhite,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: kDark),
        ),
        child: TextField(
          controller: widget.controller,
          obscureText: widget.isPassword && !widget.isPasswordVisible,
          style: TextStyle(color: kDark),
          decoration: InputDecoration(
            hintText: widget.hint,
            hintStyle: TextStyle(color: kGreyLight, fontSize: 15),
            prefixIcon: Icon(widget.icon, color: kPrimary, size: 22),
            suffixIcon: widget.suffix,
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(vertical: 18),
          ),
        ),
      ),
    );
  }
}
