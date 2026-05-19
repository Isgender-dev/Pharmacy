import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:pharmacy/constants/constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: kPrimaryLight,
          title: Container(
            height: 40,
            decoration: BoxDecoration(
              color: kWhite,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: TextField(
                cursorColor: kPrimary,
                decoration: InputDecoration(
                  hintText: 'Gözleg',
                  hintStyle: TextStyle(color: kGray),
                  suffixIcon: Icon(AntDesign.search1, color: kGray),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                ),
              ),
            ),
          ),
        ),
      body: Center(child: Text('Baş sahypa'),),
    );
  }
}