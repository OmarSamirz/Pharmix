import 'package:flutter/material.dart';
import 'package:pharmix/Utilities/colors.dart';
import 'package:pharmix/Utilities/image_path.dart';
import 'package:pharmix/data/product_list.dart';
import 'package:pharmix/widgets/custom_app_bar.dart';
import 'package:pharmix/widgets/icon_component.dart';
import 'package:pharmix/widgets/search_product.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({
    super.key,
  });

  @override
  State<SearchScreen> createState() {
    return _SearchScreen();
  }
}

class _SearchScreen extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: CustomAppBar(
        // isSearch: true,
        isSearch: true,
        secondLeading: IconComponent(icon: cartIcon),
        thirdLeading: IconComponent(icon: notificationIcon),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15, bottom: 10),
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (_, index) {
            return SearchProduct(product: product1);
          },
        ),
      ),
    );
  }
}
