import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_ecommerce/components/Item_popular_product.dart';
import 'package:ui_ecommerce/model/products.dart';
import 'package:ui_ecommerce/screens/details/details_screen.dart';
import 'package:ui_ecommerce/screens/home/components/section_title.dart';
import 'package:ui_ecommerce/size_config.dart';
import 'package:ui_ecommerce/state_managements/favorite_provider.dart';


class PopularProducts extends StatelessWidget {
  const PopularProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: const SectionTitle(
            title: "Popular Products",
          ),
        ),
        SizedBox(height: getProportionateScreenHeight(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            height: getProportionateScreenWidth(220),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
              child: Consumer<FavoriteProvider>( 
                builder: (context, products, child) => Row(
                  children: List.generate(products.listProducts.length, (index) {
                    final Product product = products.listProducts[index];
                    return ItemPopularProduct(
                      product: product,
                      press: () => Navigator.pushNamed(
                          context, DetailScreen.routeName,
                          arguments: product),
                    );
                  }),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
