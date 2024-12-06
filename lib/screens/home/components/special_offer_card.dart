import 'package:flutter/material.dart';
import 'package:ui_ecommerce/size_config.dart';

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    super.key,
    required this.image,
    required this.category,
    required this.numOfBrands,
    required this.press,
  });

  final String image, category, numOfBrands;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
      child: GestureDetector(
        onTap: press,
        child: Stack(children: [
          Container(
            width: getProportionateScreenWidth(242),
            height: getProportionateScreenWidth(100),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  image,
                ),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          Container(
            width: getProportionateScreenWidth(242),
            height: getProportionateScreenWidth(100),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(colors: [
                  const Color(0xff343434).withOpacity(0.4),
                  const Color(0xff343434).withOpacity(0.15)
                ])),
          ),
          Positioned(
            left: getProportionateScreenWidth(10),
            top: getProportionateScreenWidth(10),
            child: Text.rich(
              TextSpan(
                style: const TextStyle(color: Colors.white),
                children: [
                  TextSpan(
                      text: "$category\n",
                      style: TextStyle(
                          fontSize: getProportionateScreenWidth(18),
                          fontWeight: FontWeight.bold)),
                  TextSpan(text: "$numOfBrands Brands")
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
