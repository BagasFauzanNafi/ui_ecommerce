import 'package:flutter/material.dart';
import 'package:ui_ecommerce/components/product_card.dart';
import 'package:ui_ecommerce/model/products.dart';
import 'package:ui_ecommerce/screens/details/details_screen.dart';
import 'package:ui_ecommerce/size_config.dart';
import 'section_title.dart';

class PopularProducts extends StatelessWidget {
  static String routeName = "/popular_product";
  const PopularProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: "Popular Products"),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(
                  demoProducts.length, 
                  (index) {
                    final Product product = demoProducts[index];
                    return ProductCard(
                      product: demoProducts[index], 
                      press: () => Navigator.pushNamed(
                        context, DetailScreen.routeName, 
                        arguments: product
                        ,
                      ),
                    );
                  }
                ),
              ),
        )
      ],
    );
  }
}
