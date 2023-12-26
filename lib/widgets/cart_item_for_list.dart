import 'package:flutter/material.dart';
import 'package:pharmix/Utilities/colors.dart';
import 'package:pharmix/Utilities/image_path.dart';
import 'package:pharmix/Utilities/size_helpers.dart';
import 'package:pharmix/models/product.dart';
// import 'package:pharmix/widgets/custom_cart_button.dart';
import 'package:pharmix/widgets/plus_minus_widget.dart';


class CartItem extends StatelessWidget {
  const CartItem({required this.product, super.key});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      //remove borders and background
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      color: Colors.white,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Column(
              children: [
                Image.asset(
                  productImage,
                  width: screenWidthSize(context) * 0.2,
                ),
              ],
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.category,
                    maxLines: 1,
                    style: TextStyle(
                      color: fifthTextColor,
                      fontSize: 13,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    product.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: primaryTextColor,
                      fontSize: 16,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    product.companyName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: secondaryTextColor,
                      fontSize: 12.5,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 8,
                    right: 4,
                    bottom: 37,
                  ),
                  child: Column(
                    children: [
                      Text(
                        'E£${product.price.toString()}',
                        style: TextStyle(
                          color: priceColor,
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const PlusMinus()
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
