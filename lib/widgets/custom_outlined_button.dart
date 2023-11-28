import 'package:flutter/material.dart';
import 'package:pharmix/Utilities/colors.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      style: ButtonStyle(
        surfaceTintColor:
            MaterialStateColor.resolveWith((states) => priceColor),
        overlayColor:
            MaterialStateColor.resolveWith((states) => Colors.transparent),
        side: MaterialStateProperty.resolveWith(
          (states) => BorderSide(
            color: priceColor,
            width: 3,
          ),
        ),
        shape: MaterialStateProperty.resolveWith(
          (states) => RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      child: Text(
        'Add to Cart',
        style: TextStyle(
          fontSize: 13,
          color: priceColor,
        ),
      ),
    );
  }
}
