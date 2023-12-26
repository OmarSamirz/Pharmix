import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pharmix/Utilities/colors.dart';
import 'package:pharmix/Utilities/image_path.dart';
import 'package:pharmix/providers/products_provider.dart';
import 'package:pharmix/widgets/home_category_widget.dart';
import 'package:pharmix/widgets/custom_search_bar.dart';
import 'package:pharmix/widgets/home_product.dart';
import 'package:pharmix/widgets/icon_component.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: IconComponent(icon: locationIcon),
                  ),
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
                  const Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: IconComponent(icon: cartIcon),
                  ),
                  const IconComponent(icon: notificationIcon),
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
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                HomeCategoryWidget(icon: locationIcon, title: 'Antibiotics'),
                HomeCategoryWidget(icon: locationIcon, title: 'Antibiotics'),
                HomeCategoryWidget(icon: locationIcon, title: 'Antibiotics'),
                HomeCategoryWidget(icon: locationIcon, title: 'Antibiotics'),
              ],
            ),
            Expanded(
              child: FutureBuilder(
                future: ref.read(productsProvider),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // Show a loading indicator while waiting for the Future to complete
                    return const CircularProgressIndicator();
                  } else {
                    return ListView.builder(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: HomeProduct(product: snapshot.data![index]),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
