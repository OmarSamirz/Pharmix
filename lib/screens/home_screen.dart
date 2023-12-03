import 'package:flutter/material.dart';
import 'package:pharmix/Utilities/colors.dart';
import 'package:pharmix/Utilities/image_path.dart';
import 'package:pharmix/data/product_list.dart';
import 'package:pharmix/widgets/home_category_widget.dart';
import 'package:pharmix/widgets/custom_search_bar.dart';
import 'package:pharmix/widgets/home_product.dart';
import 'package:pharmix/widgets/icon_component.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Row(
                children: [
                  IconComponent(icon: locationIcon),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Your location',
                        style: TextStyle(
                          color: fifthTextColor,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        'Cairo, New Cairo',
                        style: TextStyle(
                          color: primaryTextColor,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconComponent(icon: cartIcon),
                  IconComponent(icon: notificationIcon),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 5),
              child: CustomSearchBar(isClick: true),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Row(
                children: [
                  const Text(
                    'Catergories',
                    style: TextStyle(
                      color: Color(0xFF284169),
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      padding: MaterialStateProperty.resolveWith(
                          (states) => EdgeInsets.zero),
                      overlayColor: MaterialStateColor.resolveWith(
                          (states) => Colors.transparent),
                      foregroundColor: MaterialStateColor.resolveWith(
                        (states) => const Color.fromARGB(255, 161, 161, 161),
                      ),
                    ),
                    child: const Row(
                      children: [
                        Text(
                          'See more',
                          style: TextStyle(fontSize: 15),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 3),
                          child: Icon(
                            Icons.keyboard_arrow_right_rounded,
                            size: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                HomeCategoryWidget(icon: locationIcon, title: 'Antibiotics'),
                HomeCategoryWidget(icon: locationIcon, title: 'Antibiotics'),
                HomeCategoryWidget(icon: locationIcon, title: 'Antibiotics'),
                HomeCategoryWidget(icon: locationIcon, title: 'Antibiotics'),
              ],
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                itemCount: productList.length,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: HomeProduct(product: productList[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
