import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:pharmacy/constants/constants.dart';
import 'package:pharmacy/core/token_storage.dart';
import 'package:pharmacy/services/order_service.dart';
import 'package:pharmacy/views/cart/cart_item.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<dynamic> Orders = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await loadOrders();
    });
  }

  Future<void> loadOrders() async {
    print("TOKEN: ${TokenStorage.token}");

    if (TokenStorage.token == null || TokenStorage.token!.isEmpty) {
      setState(() => isLoading = false);
      return;
    }

    try {
      final response = await OrderService().getOrders();

      print("RESPONSE: ${response.data}");

      setState(() {
        Orders = response.data['data'] ?? [];
        isLoading = false;
      });
    } catch (e, st) {
      print('TYPE: ${e.runtimeType}');
      print('STACK: $st');
      print('ERROR: $e');

      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {

    

    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            _header(context),
            if (Orders.isEmpty) 
       const Expanded(child: Center(child: Text("Sebet boş")))
        else 
            Expanded(
              child: ListView.builder(
                itemCount: Orders.length,
                itemBuilder: (context, index) {
                  final item = Orders[index];
              
                  return CartItem(
                    title: item['name'] ?? '',
                    description: item['description'],
                    price: item['price'].toDouble(),
                    quantity: 1,
                    onDelete: () {},
                    onIncrease: () {},
                    onDecrease: () {},
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _header(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: kGreyLight)),
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
            icon: const Icon(Icons.close, color: kGrey),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}
