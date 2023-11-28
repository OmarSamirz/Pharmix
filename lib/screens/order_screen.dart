import 'package:flutter/material.dart';
import 'package:pharmix/Utilities/image_path.dart';
import 'package:pharmix/data/product_list.dart';
import 'package:pharmix/widgets/custom_app_bar.dart';
import 'package:pharmix/widgets/home_product.dart';
import 'package:pharmix/widgets/icon_component.dart';

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
        secondLeading: IconComponent(icon: cartIcon),
        thirdLeading: IconComponent(icon: notificationIcon),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
        child: Column(
          children: [
            ListView.builder(
              itemCount: productList.length,
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: HomeProduct(product: productList[index]),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
