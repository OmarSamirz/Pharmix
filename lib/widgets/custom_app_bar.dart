import 'package:flutter/material.dart';
import 'package:pharmix/Utilities/colors.dart';
import 'package:pharmix/widgets/custom_back_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.size = 100,
    this.title = '',
    this.firstLeading,
    this.secondLeading,
    this.thirdLeading,
  });

  final double size;
  final String title;
  final Widget? firstLeading;
  final Widget? secondLeading;
  final Widget? thirdLeading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        decoration: const ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(35),
              bottomRight: Radius.circular(35),
            ),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x3F8FBDFD),
              blurRadius: 10,
              offset: Offset(0, 4),
              spreadRadius: 5,
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 120 / 2.5, 20, 0),
          child: Stack(
            children: [
              Positioned.fill(
                child: Center(
                  child: Text(
                    title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: primaryTextColor),
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
                          child: const CustomBackButton(),
                        ),
                    const Spacer(),
                    if (secondLeading != null)
                      Padding(
                        padding: EdgeInsets.only(
                            right: (thirdLeading != null) ? 10 : 0),
                        child: secondLeading!,
                      ),
                    if (thirdLeading != null) thirdLeading!,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.maxFinite, size);
}
