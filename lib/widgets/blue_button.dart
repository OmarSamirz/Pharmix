import 'package:flutter/material.dart';
import 'package:pharmix/Utilities/util.dart';
import 'package:pharmix/Utilities/colors.dart';
import 'package:page_transition/page_transition.dart';

class BlueButton extends StatelessWidget {
  const BlueButton({
    super.key,
    required this.title,
    this.fontWeight,
    this.fontSize,
    this.blurRadius,
    this.offsetY,
    this.radiusCurve,
    this.spreadRadius,
    this.chosenScreen,
    this.checkInputs,
  });

  final String title;
  final FontWeight? fontWeight;
  final double? fontSize;
  final double? blurRadius;
  final double? offsetY;
  final double? radiusCurve;
  final double? spreadRadius;
  final Widget? chosenScreen;
  final Future<bool> Function()? checkInputs;

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
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radiusCurve ?? 10),
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
        onPressed: () async {
          if (await checkInputs!() == true) {
            if (title == 'Sign In' || title == 'Sign Up') {
              await Future.delayed(const Duration(seconds: 2));
            }
            if (context.mounted) {
              goToScreenBlueButton(context);
            }
          }
        },
        style: ButtonStyle(
          overlayColor: MaterialStateColor.resolveWith((states) => priceColor),
          backgroundColor:
              MaterialStateColor.resolveWith((states) => blueColor),
          shape: MaterialStateProperty.resolveWith(
            (states) => RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radiusCurve ?? 10),
            ),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: fontSize ?? 20,
            color: Colors.white,
            fontWeight: fontWeight ?? FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
