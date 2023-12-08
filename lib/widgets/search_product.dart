import 'package:flutter/material.dart';
import 'package:pharmix/Utilities/colors.dart';
import 'package:pharmix/Utilities/image_path.dart';
import 'package:pharmix/Utilities/size_helpers.dart';
import 'package:pharmix/models/product.dart';
import 'package:pharmix/widgets/blue_button.dart';
import 'package:pharmix/widgets/custom_outlined_button.dart';
import 'package:pharmix/widgets/icon_component.dart';

class SearchProduct extends StatelessWidget {
  const SearchProduct({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
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
            )
          ],
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconComponent(
                icon: heartIcon,
                color: greyColor,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(productImage,
                    width: screenWidthSize(context) * 0.25),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Text(
                          product.name,
                          style: TextStyle(
                            color: primaryTextColor,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        product.amount,
                        style: TextStyle(
                          color: thirdTextColor,
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'E£${product.price}',
                                style: TextStyle(
                                  color: priceColor,
                                  // fontSize: 20,
                                  fontSize: screenWidthSize(context) * 0.047,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'E£${product.oldPrice}',
                                style: TextStyle(
                                  color: redColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor: Colors.red,
                                  decorationThickness: 1.5,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Text(
                            '${product.discountAmount}% OFF',
                            style: TextStyle(
                              color: discountColor,
                              fontSize: 15,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          SizedBox(
                            width: screenWidthSize(context) * .28,
                            height: screenHeightSize(context) * .04,
                            child: const CustomOutlinedButton(
                                title: 'Add to Cart'),
                          ),
                          const Spacer(),
                          SizedBox(
                            width: screenWidthSize(context) * .28,
                            height: screenHeightSize(context) * .04,
                            child: const BlueButton(
                              title: 'Buy Now',
                              fontSize: 15,
                              spreadRadius: 1,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
