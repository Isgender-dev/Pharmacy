import 'package:flutter/material.dart';
import 'package:pharmacy/constants/constants.dart';

class CartItem extends StatelessWidget {
  final String title;
  final double price;
  final String description;
  final int quantity;

  final VoidCallback onDelete;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  const CartItem({
    super.key,
    required this.title,
    required this.price,
    required this.quantity,
    required this.description,
    required this.onDelete,
    required this.onIncrease,
    required this.onDecrease,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: kGreyShade,
            ),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 82,
              height: 82,
              decoration: BoxDecoration(
                color: kGreyShade,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Icon(Icons.error)
              ),
            ),
      
            const SizedBox(width: 16),
      
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: onDelete,
                        icon: const Icon(
                          Icons.delete_outline,
                          color: kRed,
                        ),
                      ),
                    ],
                  ),
      
                  Text(
                    "Harytyň bahasy ${price.toString()}",
                    style: TextStyle(
                      color: kGrey
                    ),
                  ),
      
                  const SizedBox(height: 6),
      
                  Text(
                    "${(price * quantity).toString()}",
                    style: const TextStyle(
                      color: kPrimary,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
      
                  const SizedBox(height: 10),
      
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      width: 120,
                      height: 42,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: kGreyShade,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: IconButton(
                              onPressed: onDecrease,
                              icon: const Icon(Icons.remove),
                            ),
                          ),
      
                          Text(
                            "$quantity",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
      
                          Expanded(
                            child: IconButton(
                              onPressed: onIncrease,
                              icon: const Icon(Icons.add),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}