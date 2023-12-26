import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pharmix/Utilities/colors.dart';
import 'package:pharmix/Utilities/image_path.dart';
import 'package:pharmix/widgets/custom_back_button.dart';
import 'package:pharmix/widgets/custom_search_bar.dart';
import 'package:pharmix/widgets/icon_component.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title = '',
    this.isSearch = false,
    this.isFilter = false,
    this.firstLeading,
    this.secondLeading,
    this.thirdLeading,
  });

  final String title;
  final bool? isSearch;
  final bool? isFilter;
  final IconComponent? firstLeading;
  final IconComponent? secondLeading;
  final IconComponent? thirdLeading;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular((Platform.isAndroid) ? 35 : 25),
            bottomRight: Radius.circular((Platform.isAndroid) ? 35 : 25),
          ),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x3F8FBDFD),
            blurRadius: 10,
            offset: Offset(0, 4),
            spreadRadius: 5,
          )
        ],
      ),
      child: Padding(
        padding:
            EdgeInsets.fromLTRB(20, isSearch == true ? 0 : 120 / 2.5, 20, 0),
        child: Stack(
          children: [
            Positioned.fill(
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: primaryTextColor,
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  firstLeading ??
                      Transform.translate(
                        offset: const Offset(0, 0),
                        child: (title != 'Orders' && title != 'Profile')
                            ? const CustomBackButton()
                            : null,
                      ),
                  const Spacer(),
                  if (secondLeading != null)
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: secondLeading!,
                    ),
                  if (thirdLeading != null) thirdLeading!,
                ],
              ),
            ),
            if (isSearch == true)
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 12.0),
                          child: CustomSearchBar(
                            isClick: false,
                            showKeyboard: true,
                          ),
                        ),
                      ),
                      if (isFilter == true)
                        ElevatedButton(
                          onPressed: () {},
                          child: ImageIcon(
                            AssetImage(filterIcon),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize {
    double size = (Platform.isAndroid) ? 85 : 70;

    return Size(double.maxFinite, isSearch == true ? 150 : size);
  }
}
