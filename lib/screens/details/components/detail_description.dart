import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/model/products.dart';
import 'package:ui_ecommerce/size_config.dart';
import 'package:ui_ecommerce/state_managements/favorite_provider.dart';

class DetailDescription extends StatelessWidget {
  const DetailDescription({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Text(
            product.title,
            style: TextStyle(
              fontSize: getProportionateScreenWidth(20),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            padding: EdgeInsets.all(getProportionateScreenWidth(10)),
            width: getProportionateScreenWidth(64),
            decoration: BoxDecoration(
              color: product.isFavourite
                  ? kPrimaryColor.withOpacity(0.1)
                  : kSecondaryColor.withOpacity(0.1),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            child: Consumer<FavoriteProvider>(
              builder: (context, favorite, child) => IconButton(
                icon: Icon(
                  Icons.favorite,
                  size: getProportionateScreenWidth(18),
                ),
                onPressed: () {
                  favorite.toggleFavouriteStatus(product.id);
                },
                color: product.isFavourite
                    ? Colors.red
                    : kSecondaryColor.withOpacity(0.5),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: getProportionateScreenWidth(20),
            right: getProportionateScreenWidth(64),
          ),
          child: ReadMoreText(product.description,
              trimMode: TrimMode.Line,
              trimLines: 2,
              colorClickableText: kPrimaryColor,
              trimCollapsedText: "\nSee More Detail >",
              trimExpandedText: "\nSee Less Detail >",
              moreStyle: seeMoreStyle,
              lessStyle: seeMoreStyle),
        )
      ],
    );
  }
}
