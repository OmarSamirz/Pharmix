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
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: CustomAppBar(
        title: 'Orders',
        secondLeading: IconComponent(icon: cartIcon, size: 18),
        thirdLeading: IconComponent(icon: notificationIcon),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                // itemCount: productList.length,
                itemCount: 1,
                itemBuilder: (_, index) {
                  return OrderProduct(order: order1, product: product1);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
