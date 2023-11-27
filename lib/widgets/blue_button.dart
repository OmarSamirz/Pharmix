import 'package:flutter/material.dart';
import 'package:pharmix/Utilities/util.dart';
import 'package:pharmix/Utilities/colors.dart';
import 'package:page_transition/page_transition.dart';

class BlueButton extends StatelessWidget {
  const BlueButton({
    super.key,
    required this.title,
    this.width,
    this.height,
    this.fontWeight,
    this.blurRadius,
    this.offsetY,
    this.spreadRadius,
    this.chosenScreen,
    this.checkInputs,
  });

  final String title;
  final double? width;
  final double? height;
  final FontWeight? fontWeight;
  final double? blurRadius;
  final double? offsetY;
  final double? spreadRadius;
  final Widget? chosenScreen;
  final bool Function()? checkInputs;

  void goToScreenBlueButton(BuildContext context) {
    if (chosenScreen == null) return;

    if (title == 'Sign In' || title == 'Sign Up') {
      Navigator.of(context).pushAndRemoveUntil(
          PageTransition(child: chosenScreen!, type: PageTransitionType.fade),
          (route) => false);
      return;
    }

    goToScreen(context, chosenScreen!, PageTransitionType.fade);
  }

  @override
  Widget build(BuildContext context) {
    double width = 0.0;
    double height = 0.0;
    if (this.width == null) {
      width = MediaQuery.sizeOf(context).width;
      height = width * (13 / 85);
    } else {
      width = this.width!;
      height = this.height!;
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular((width + height) * 0.03614),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF8FBDFD),
            blurRadius: blurRadius ?? 6,
            offset: Offset(0, offsetY ?? 4),
            spreadRadius: spreadRadius ?? 4,
          )
        ],
      ),
      child: ElevatedButton(
        onPressed: () {
          if (checkInputs!() == true) {
            goToScreenBlueButton(context);
          }
        },
        style: ButtonStyle(
          fixedSize: MaterialStateProperty.resolveWith(
            (states) => Size(width, height),
          ),
          overlayColor:
              MaterialStateColor.resolveWith((states) => Colors.transparent),
          backgroundColor:
              MaterialStateColor.resolveWith((states) => blueColor),
          shape: MaterialStateProperty.resolveWith(
            (states) => RoundedRectangleBorder(
              borderRadius: BorderRadius.circular((width + height) * 0.03614),
            ),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: (width + height) * 0.05501,
            color: Colors.white,
            fontWeight: fontWeight ?? FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
