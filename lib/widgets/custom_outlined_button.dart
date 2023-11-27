import 'package:flutter/material.dart';
import 'package:pharmix/Utilities/colors.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 1.5,
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height / 25,
        width: MediaQuery.sizeOf(context).width / 3,
        child: OutlinedButton(
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
        ),
      ),
    );
  }
}
