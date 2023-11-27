import 'package:flutter/material.dart';
import 'package:pharmix/Utilities/colors.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  bool _unfocus(BuildContext context) {
    var currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 27,
      width: 27,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0x3F8FBDFD),
            blurRadius: 12,
            offset: Offset(0, 5),
            spreadRadius: 5,
          )
        ],
      ),
      child: IconButton(
        padding: const EdgeInsets.all(0),
        icon: const Icon(Icons.arrow_back_ios_sharp),
        color: Colors.black,
        iconSize: 18,
        style: ButtonStyle(
          overlayColor:
              MaterialStateColor.resolveWith((states) => Colors.transparent),
          backgroundColor:
              MaterialStateColor.resolveWith((states) => whiteColor),
          shape: MaterialStateProperty.resolveWith(
            (states) => RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        onPressed: () {
          var isKeyboard = _unfocus(context);
          Future.delayed(Duration(milliseconds: isKeyboard ? 0 : 200), () {
            Navigator.of(context).pop();
          });
        },
      ),
    );
  }
}
