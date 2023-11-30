import 'package:flutter/material.dart';
import 'package:pharmix/Utilities/colors.dart';
import 'package:pharmix/Utilities/image_path.dart';
import 'package:pharmix/widgets/custom_search_bar.dart';
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
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: Column(
            children: [
              Row(
                children: [
                  IconComponent(icon: searchIcon),
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
              const Padding(
                padding: EdgeInsets.only(top: 10, bottom: 0),
                child: CustomSearchBar(isClick: true),
              ),
              const Text('Recommended'),
              const Text('catergories '),
            ],
          ),
        ),
      ),
    );
  }
}
