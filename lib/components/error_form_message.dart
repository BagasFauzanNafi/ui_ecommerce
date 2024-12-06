
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ui_ecommerce/size_config.dart';

class ErorrFormMessage extends StatelessWidget {
  final List<String> errors;

  const ErorrFormMessage({super.key, required this.errors});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        errors.length,
        (index) => errorText(text: errors[index]),
      ),
    );
  }

  Row errorText({required String text}) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/icons/Error.svg',
          height: getProportionateScreenHeight(14),
          width: getProportionateScreenWidth(14),
        ),
        SizedBox(width: getProportionateScreenWidth(10)),
        Text(
          text,
          style: const TextStyle(color: Colors.red),
        ),
      ],
    );
  }
}
