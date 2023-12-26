import 'package:flutter/material.dart';
// import 'package:pharmix/Utilities/image_path.dart';
import 'package:pharmix/Utilities/size_helpers.dart';

class CartButton extends StatelessWidget {
  const CartButton({super.key, required this.icon});

  final String icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: 20,
      height: screenHeightSize(context) * 0.03,
      child: OutlinedButton(
        onPressed: () {},
        style:  OutlinedButton.styleFrom(shape: const CircleBorder(eccentricity: 0.0),),
        child: Image.asset(
          icon,
          height: screenHeightSize(context)*0.017,
        ),
      ),
    );
  }
}
