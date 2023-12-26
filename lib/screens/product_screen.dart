import 'package:flutter/material.dart';
import 'package:pharmix/Utilities/colors.dart';
import 'package:pharmix/Utilities/image_path.dart';
import 'package:pharmix/Utilities/size_helpers.dart';
// import 'package:pharmix/screens/cart_screen.dart';
import 'package:pharmix/widgets/blue_button.dart';
import 'package:pharmix/widgets/custom_app_bar.dart';
// import 'package:pharmix/widgets/custom_cart_button.dart';
import 'package:pharmix/widgets/custom_outlined_button.dart';
import 'package:pharmix/widgets/icon_component.dart';
import 'package:pharmix/widgets/plus_minus_widget.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _ProductScreenState();
  }
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        secondLeading: IconComponent(icon: cartIcon),
        thirdLeading: IconComponent(icon: notificationIcon),
      ),
      body: Column(
        children: [
          SizedBox(
            height: screenHeightSize(context) * 0.03,
          ),
          Center(
            child: Container(
              width: screenWidthSize(context) * 0.90,
              // height: 810,
              decoration: const ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x3F8FBDFD),
                    blurRadius: 10,
                    offset: Offset(0, 4),
                    spreadRadius: 3,
                  )
                ],
              ),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 10, top: 10, bottom: 0),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: IconComponent(
                        icon: heartIcon,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Image.asset(
                      productImage,
                      width: screenWidthSize(context) * 0.7,
                      height: screenHeightSize(context) * 0.22,
                      fit: BoxFit.contain,
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            width: screenWidthSize(context) * 0.90,
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color(0x3F8FBDFD),
                  blurRadius: 10,
                  offset: Offset(0, -10),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5, left: 15),
                  child: Text(
                    'Vitamin C Complex',
                    style: TextStyle(
                      color: primaryTextColor,
                      fontSize: 25,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      // height: 0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    'By link Nutrition',
                    style: TextStyle(
                      color: secondaryTextColor,
                      fontSize: 20,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      // height: 0,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        '60 Capsules in Bottle',
                        style: TextStyle(
                          color: thirdTextColor,
                          fontSize: 13,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: SizedBox(
                        width: screenWidthSize(context) * 0.32,
                        height: screenHeightSize(context) * 0.04,
                        child: const CustomOutlinedButton(title: 'Add To Cart'),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                            'E£150',
                            style: TextStyle(
                              color: priceColor,
                              fontSize: 27,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 18, top: 40),
                          child: Text(
                            '20% OFF',
                            style: TextStyle(
                              color: discountColor,
                              fontSize: 12,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 8, top: 4),
                          child: SizedBox(
                            width: screenWidthSize(context) * 0.32,
                            height: screenHeightSize(context) * 0.035,
                            child: const BlueButton(
                              title: 'Buy Now',
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 22, bottom: 22),
                      child: Text(
                        'E£200',
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          decorationColor: redColor,
                          color: redColor,
                          fontSize: 15.53,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            width: screenWidthSize(context) * 0.90,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color(0x3F8FBDFD),
                  blurRadius: 10,
                  offset: Offset(0, -10),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 10, bottom: 15),
                  child: Text(
                    'Quantity',
                    style: TextStyle(
                      color: cartColor,
                      fontSize: 20,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
                const Spacer(),
                const Padding(
                  padding:  EdgeInsets.only(top: 10),
                  child: PlusMinus(),
                ),
              ],
            ),
          ),
          Expanded(
            child: SafeArea(
              child: Container(
                width: screenWidthSize(context) * 0.90,
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 20,
                  right: 20,
                  bottom: 5,
                ),
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x3F8FBDFD),
                      blurRadius: 10,
                      offset: Offset(0, -10),
                      spreadRadius: 0,
                    ),
                  
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text(
                        'Description',
                        style: TextStyle(
                          color: cartColor,
                          fontSize: 20,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        width: screenWidthSize(context)*0.9,
                        child: const SingleChildScrollView(
                          child: Text(
                            'Vitamin C Complex contains Food  Based vitamin C and zinc which contribute to the normal function of the immune system, protection of cells from oxidative stress and normal function of the immune system during and after intense physical exercise gfdgdfgdfgdfgdfgdfgdfhkjahjfhadsjkfhkjasfhjkshfkjahfkjdshfkdsfhkdshfkjsdhfjdshfkshfkhsfkhsdkjfh',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              height: 0,
                              // overflow: TextOverflow.ellipsis
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
