import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:pharmacy/constants/constants.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            _header(context),
            const Expanded(child: Center(child: Text("Sebet boş"))),
          ],
        ),
      ),
    );
  }

  Widget _header(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: kGrayLight)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Row(
            children: [
              Icon(AntDesign.shoppingcart),
              SizedBox(width: 10),
              Text('Sebet', style: TextStyle(fontWeight: FontWeight.w500)),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.close, color: kGray),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}