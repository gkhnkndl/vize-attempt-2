import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/cart_item.dart';
import '../models/cart.dart';
import '../models/shoe.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // heading
            const Text(
              "My Cart",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),

            Expanded(child: ListView.builder(
              itemCount: value.getUserCart().length,
              itemBuilder: (context, index) {
                //get individual shoe
                Shoe individualShoe = value.getUserCart()[index];

                //return cart item
                return CartItem(
                  shoe: individualShoe,
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}