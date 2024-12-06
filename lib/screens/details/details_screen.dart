import 'package:flutter/material.dart';
import 'package:ui_ecommerce/model/products.dart';
import 'package:ui_ecommerce/screens/details/components/body.dart';

class DetailScreen extends StatelessWidget {
  static String routeName = "/detail";
  const DetailScreen({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
          Navigator.pop(context);
          }, 
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text("${product.rating}",
                style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 5,),
                const Icon(Icons.star, size: 20, color: Colors.yellowAccent,)
              ],
            ),
          )
        ],
      ),
      body: Body(product: product),
    );
  }
}