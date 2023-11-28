import 'package:flutter/material.dart';
import 'package:pharmix/Utilities/util.dart';
import 'package:page_transition/page_transition.dart';

class IconComponent extends StatelessWidget {
  const IconComponent({
    super.key,
    required this.icon,
    this.color,
    this.size,
    this.chosenScreen,
  });

  final String icon;
  final double? size;
  final Color? color;
  final Widget? chosenScreen;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          width: 35,
          height: 35,
          decoration: const ShapeDecoration(
            color: Colors.white,
            shape: OvalBorder(),
            shadows: [
              BoxShadow(
                color: Color(0x3F8FBDFD),
                blurRadius: 10,
                offset: Offset(0, 4),
                spreadRadius: 4,
              ),
            ],
          ),
        ),
        Container(
          width: 25,
          height: 25,
          decoration: const ShapeDecoration(
            color: Colors.white,
            shape: OvalBorder(),
            shadows: [
              BoxShadow(
                color: Color(0x3F8FBDFD),
                blurRadius: 4,
                offset: Offset(0, 4),
                spreadRadius: 2,
              ),
            ],
          ),
        ),
        IconButton(
          icon: ImageIcon(
            AssetImage(icon),
            color: color ?? const Color(0xFF4495FE),
            size: size ?? 20,
          ),
          style: ButtonStyle(
            overlayColor:
                MaterialStateColor.resolveWith((states) => Colors.transparent),
          ),
          onPressed: () {
            if (chosenScreen != null) {
              goToScreen(
                  context, chosenScreen!, PageTransitionType.leftToRight);
            }
          },
        ),
      ],
    );
  }
}
