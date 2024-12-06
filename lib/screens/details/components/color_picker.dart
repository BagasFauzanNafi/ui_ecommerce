import 'package:flutter/material.dart';
import 'package:ui_ecommerce/components/rounded_icon_button.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/model/products.dart';
import 'package:ui_ecommerce/size_config.dart';

class ColorPicker extends StatefulWidget {
  const ColorPicker({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  int currentSelectedColor = 0;
  int totalSelected = 1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: SizedBox(
        height: getProportionateScreenWidth(40),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ...List.generate(
              widget.product.colors.length,
              (index) {
                final Color color = widget.product.colors[index];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      currentSelectedColor = index;
                    });
                  },
                  child: ItemColorDot(
                    color: color,
                    isSelected: index == currentSelectedColor,
                  ),
                );
              },
            ),
            const Spacer(),
            Row(
              children: [
                RoundedIconBtn(
                    icon: Icons.remove,
                    press: totalSelected > 1
                        ? () {
                            setState(() {
                              totalSelected--;
                            });
                          }
                        : null),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "$totalSelected",
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
                RoundedIconBtn(
                    icon: Icons.add,
                    showShadow: true,
                    press: () {
                      setState(() {
                        totalSelected++;
                      });
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ItemColorDot extends StatelessWidget {
  const ItemColorDot({super.key, required this.color, this.isSelected = false});

  final bool isSelected;

  final Color color;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: defaultDuration,
      margin: EdgeInsets.only(right: getProportionateScreenWidth(10)),
      padding: EdgeInsets.all(getProportionateScreenWidth(8)),
      height: getProportionateScreenWidth(isSelected ? 40 : 20),
      width: getProportionateScreenWidth(isSelected ? 40 : 20),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? kPrimaryColor : Colors.transparent,
          width: 1.5,
        ),
      ),
    );
  }
}
