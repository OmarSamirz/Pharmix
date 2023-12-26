import 'package:flutter/material.dart';
import 'package:pharmix/Utilities/colors.dart';
import 'package:pharmix/Utilities/size_helpers.dart';

class UnifiedCartWidget extends StatelessWidget {
  const UnifiedCartWidget({
    super.key,
    required this.bottomWidget,
    required this.title,
    this.padSize,
  });
  final EdgeInsetsGeometry? padSize;
  final Widget bottomWidget;
  final String title;
  //add a cart class

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidthSize(context) * 0.90,
      // height: screenHeightSize(context) * 0.135,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x3F8FBDFD),
            blurRadius: 7,
            offset: Offset(0, 4),
            spreadRadius: 4,
          )
        ],
      ),
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                height: screenHeightSize(context) * 0.05,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x3F8FBDFD),
                      blurRadius: 8,
                      offset: Offset(0, 4),
                      spreadRadius: 4,
                    )
                  ],
                ),
              ),
              Padding(
                padding: padSize?? const EdgeInsets.all(0),
                child: bottomWidget,
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 15,
              top: 8,
            ),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: primaryTextColor,
              ),
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}
