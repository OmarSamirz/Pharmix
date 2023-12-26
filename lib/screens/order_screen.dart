import 'package:flutter/material.dart';
import 'package:pharmix/Utilities/image_path.dart';
import 'package:pharmix/data/order_list.dart';
import 'package:pharmix/data/product_list.dart';
import 'package:pharmix/widgets/custom_app_bar.dart';
import 'package:pharmix/widgets/icon_component.dart';
import 'package:pharmix/widgets/order_product.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() {
    return _OrderScreen();
  }
}

class _OrderScreen extends State<OrderScreen> {
  var _isActiveContent = true;

  @override
  Widget build(BuildContext context) {
    Widget content = Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 20, bottom: 10),
        // itemCount: productList.length,
        itemCount: 5,
        itemBuilder: (_, index) {
          return OrderProduct(order: order1, product: product1);
        },
      ),
    );

    // if (!_isActiveContent) {
    //   content = ;
    // }

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: const CustomAppBar(
        title: 'Orders',
        secondLeading: IconComponent(icon: cartIcon, size: 18),
        thirdLeading: IconComponent(icon: notificationIcon),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(50, 0, 50, 5),
            height: MediaQuery.sizeOf(context).height / 4.3,
            decoration: const ShapeDecoration(
              color: Color(0xFF1479FF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35),
                ),
              ),
              shadows: [
                BoxShadow(
                  color: Color(0x3F8FBDFD),
                  blurRadius: 10,
                  offset: Offset(0, 4),
                  spreadRadius: 5,
                )
              ],
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _isActiveContent = true;
                      });
                    },
                    style: ButtonStyle(
                      overlayColor: MaterialStateColor.resolveWith(
                        (states) => Colors.transparent,
                      ),
                    ),
                    child: Text(
                      'Active',
                      style: TextStyle(
                        color: _isActiveContent ? Colors.white : Colors.white60,
                        fontSize: 21,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _isActiveContent = false;
                      });
                    },
                    style: ButtonStyle(
                      overlayColor: MaterialStateColor.resolveWith(
                        (states) => Colors.transparent,
                      ),
                    ),
                    child: Text(
                      'Completed',
                      style: TextStyle(
                        color: _isActiveContent ? Colors.white60 : Colors.white,
                        fontSize: 21,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          content,
        ],
      ),
    );
  }
}
