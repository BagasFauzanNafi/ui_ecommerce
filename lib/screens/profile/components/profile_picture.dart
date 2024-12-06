import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ui_ecommerce/size_config.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          width: getProportionateScreenWidth(115),
          height: getProportionateScreenWidth(115),
          child: Stack(
            clipBehavior: Clip.none,
            fit: StackFit.expand,
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage("assets/images/profil.jpg"),
              ),
              Positioned(
                bottom: 0,
                right: -16,
                child: Container(
                  height: getProportionateScreenWidth(46),
                  width: getProportionateScreenWidth(46),
                  padding: const EdgeInsets.all(13),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xfff5f6f9),
                      border: Border.all(color: Colors.white)),
                  child: SvgPicture.asset("assets/icons/Camera Icon.svg"),
                ),
              ),
            ],
          )),
    );
  }
}