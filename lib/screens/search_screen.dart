import 'package:flutter/material.dart';
import 'package:pharmix/Utilities/colors.dart';
import 'package:pharmix/Utilities/image_path.dart';
import 'package:pharmix/widgets/custom_app_bar.dart';
import 'package:pharmix/widgets/icon_component.dart';

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
        isSearch: true,
        secondLeading: IconComponent(icon: cartIcon),
        thirdLeading: IconComponent(icon: notificationIcon),
      ),
    );
  }
}
