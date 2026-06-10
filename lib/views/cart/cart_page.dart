import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:pharmacy/constants/constants.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(children: [_buildIcon(), _buildCloseButton(context)]),
      ),
    );
  }

  Align _buildIcon() => Align(
    alignment: Alignment.centerLeft,
    child: Row(
      children: [
        Icon(AntDesign.shoppingcart),
        SizedBox(width: 10),
        Text('Sebet'),
      ],
    ),
  );

  Align _buildCloseButton(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: IconButton(
        icon: Icon(Icons.close, color: kGray),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
