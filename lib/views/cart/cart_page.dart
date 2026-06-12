import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:pharmacy/constants/constants.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: kGrayLight)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildIcon(),
                    _buildCloseButton(context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon() => Row(
    children: [
      Icon(AntDesign.shoppingcart),
      SizedBox(width: 10),
      Text('Sebet', style: TextStyle(fontWeight: FontWeight.w500),),
    ],
  );

  Widget _buildCloseButton(BuildContext context) => IconButton(
      icon: Icon(Icons.close, color: kGray),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }
