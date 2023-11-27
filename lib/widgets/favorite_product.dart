import 'package:flutter/material.dart';
import 'package:pharmix/Utilities/colors.dart';
import 'package:pharmix/models/product.dart';
import 'package:pharmix/widgets/custom_outlined_button.dart';
import 'package:pharmix/widgets/icon_component.dart';

class FavoriteProduct extends StatelessWidget {
  const FavoriteProduct({
    super.key,
    required this.index,
    required this.product,
  });

  final int index;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: index % 2 == 0 ? 20 : 0,
        right: index % 2 != 0 ? 20 : 0,
        bottom: 10,
      ),
      child: Container(
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x3F8FBDFD),
              blurRadius: 10,
              offset: Offset(0, 4),
              spreadRadius: 3,
            ),
          ],
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Image.asset(
                      'assets/images/product_image.png',
                      width: 120,
                      height: 120,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconComponent(
                      icon: Icons.heart_broken,
                      color: redColor,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.category,
                    style: TextStyle(
                      color: fourthTextColor,
                      fontSize: 15,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    product.name,
                    style: TextStyle(
                      color: primaryTextColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    'E£${product.price}',
                    style: TextStyle(
                      color: priceColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              decoration: const ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                color: Colors.white,
                shadows: [
                  BoxShadow(
                    color: Color(0x3F8FBDFD),
                    blurRadius: 10,
                    offset: Offset(0, -5),
                    spreadRadius: 2,
                  )
                ],
              ),
              child: const CustomOutlinedButton(),
            ),
          ],
        ),
      ),
    );
  }
}
