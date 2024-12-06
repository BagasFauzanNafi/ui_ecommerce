import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ui_ecommerce/screens/cart/components/body.dart';
import 'package:ui_ecommerce/screens/cart/components/cart_bottom_navigation.dart';
import 'package:ui_ecommerce/state_managements/cart_provider.dart';

class CartScreen extends StatelessWidget {
  static String routeName = "/cart";
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: const Body(),
      bottomNavigationBar: const CartBottomNavigation(),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon:  Icon(Icons.arrow_back_ios_new_rounded,
           color: Theme.of(context).iconTheme.color,
          )),
      centerTitle: true,
      title: Column(
        children: [
          Text(
            "Your Cart",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Consumer<CartProvider>(
            builder: (context, cart, child) => 
            Text("${cart.cartItems.length} items",
                style: Theme.of(context).textTheme.bodySmall),
          ),
        ],
      ),
    );
  }
}
