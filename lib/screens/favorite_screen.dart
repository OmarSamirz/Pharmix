import 'package:flutter/material.dart';
import 'package:pharmix/Utilities/image_path.dart';
import 'package:pharmix/data/product_list.dart';
import 'package:pharmix/widgets/custom_app_bar.dart';
import 'package:pharmix/widgets/favorite_product.dart';
import 'package:pharmix/widgets/icon_component.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() {
    return _FavoriteScreen();
  }
}

class _FavoriteScreen extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: const CustomAppBar(
        title: 'Favorites',
        firstLeading: IconComponent(
          icon: filterIcon,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300,
            childAspectRatio: 2 / 2.7,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: productList.length,
          itemBuilder: (_, index) {
            return FavoriteProduct(
              product: productList[index],
              index: index,
            );
          },
        ),
      ),
    );
  }
}
