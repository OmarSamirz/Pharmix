// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:pharmix/Utilities/colors.dart';
import 'package:pharmix/Utilities/image_path.dart';
import 'package:pharmix/Utilities/size_helpers.dart';
import 'package:pharmix/data/cart_list.dart';
// import 'package:pharmix/Utilities/image_path.dart';
import 'package:pharmix/data/product_list.dart';
// import 'package:pharmix/models/cart.dart';
import 'package:pharmix/widgets/blue_button.dart';
import 'package:pharmix/widgets/custom_app_bar.dart';
import 'package:pharmix/widgets/custom_cart_list.dart';
import 'package:pharmix/widgets/scan_prescription.dart';
import 'package:pharmix/widgets/unified_cart_widget.dart';
import 'package:pharmix/widgets/custom_outlined_button.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Cart'),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Column(
                  children: [
                    const SizedBox(height: 15),
                    CartListView(
                      product: product1,
                    ),
                    const SizedBox(height: 15),
                    const ScanPrescription(),
                    const SizedBox(height: 15),
                    UnifiedCartWidget(
                        padSize: const EdgeInsets.only(right: 235, top: 17),
                        bottomWidget: Column(
                          children: [
                            Text(
                              'Add a note',
                              style: TextStyle(
                                color: fifthTextColor,
                                fontSize: 15,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 20,
                                bottom: 19,
                              ),
                              child: Container(
                                width: screenWidthSize(context) * 0.4,
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      width: 1,
                                      strokeAlign: BorderSide.strokeAlignCenter,
                                      color: fifthTextColor,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        title: 'Special request'),
                    const SizedBox(height: 15),
                    UnifiedCartWidget(
                      bottomWidget: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Container(
                          width: screenWidthSize(context) * 0.82,
                          height: 40,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  width: 0.50, color: Color(0xFFB5B5B5)),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 9,
                                ),
                                child: Image.asset(
                                  voucherIcon,
                                  width: screenWidthSize(context) * 0.11,
                                  height: screenHeightSize(context) * 0.037,
                                ),
                              ),
                              SizedBox(
                                width: screenWidthSize(context) * 0.021,
                              ),
                              Text(
                                'Enter a voucher',
                                style: TextStyle(
                                  color: fifthTextColor,
                                  fontSize: 13,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: TextButton(
                                  onPressed: () {
                                    // Add your button press logic here
                                  },
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets
                                        .zero, // Adjust padding as needed
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          0), // Set border radius to 0
                                    ),
                                  ),
                                  child: Text(
                                    'Submit',
                                    style: TextStyle(
                                      // Customize text style as needed
                                      color: priceColor, // Set text color
                                      fontSize: 13, // Set font size
                                      fontWeight:
                                          FontWeight.w500, // Set font weight
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      title: 'Add Voucher',
                      padSize: const EdgeInsets.all(0),
                    ),
                    const SizedBox(height: 15),
                    UnifiedCartWidget(
                      bottomWidget: Column(
                        children: [
                          //Row 1
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 15,
                              left: 20,
                              right: 20,
                            ),
                            child: Row(
                              children: [
                                const Text(
                                  'Subtotal',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  'E£${cart1.subTotal.toString()}',
                                  style: TextStyle(
                                    color: priceColor,
                                    fontSize: 15,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          //Row 2
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              left: 20,
                              right: 20,
                            ),
                            child: Row(
                              children: [
                                const Text(
                                  'Delivery Fees',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  'E£${cart1.deliveryFees.toString()}',
                                  style: TextStyle(
                                    color: priceColor,
                                    fontSize: 15,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          //Row 3
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              left: 20,
                              right: 20,
                              bottom: 15,
                            ),
                            child: Row(
                              children: [
                                const Text(
                                  'Total Amount',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  'E£${cart1.totalPrice.toString()}',
                                  style: TextStyle(
                                    color: priceColor,
                                    fontSize: 15,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      title: 'Payment',
                      // padSize: EdgeInsets.all(0),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: screenHeightSize(context) * 0.1,
            // color: Colors.amber,
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
            child: Row(children: [
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: SizedBox(
                  width: screenWidthSize(context) * 0.33,
                  child: const CustomOutlinedButton(title: 'Add Items'),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 18),
                child: SizedBox(
                  width: screenWidthSize(context)*0.5,
                  height: screenHeightSize(context)*0.044,
                  child:const BlueButton(title: 'Checkout'),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
