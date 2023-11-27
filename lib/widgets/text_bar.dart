import 'package:flutter/material.dart';

class TextBar extends StatelessWidget {
  const TextBar({
    super.key,
    this.width,
    this.height,
    required this.hintText,
    this.prefixIcon,
    required this.radius,
    this.keyboardType,
    this.isPassword = false,
    this.passwordCharacter = '*',
    this.fontWeight,
  });

  final double? width;
  final double? height;
  final String hintText;
  final Widget? prefixIcon;
  final double radius;
  final TextInputType? keyboardType;
  final bool? isPassword;
  final String? passwordCharacter;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    double width = 0.0;
    double height = 0.0;
    if (this.width == null && this.height == null) {
      width = MediaQuery.sizeOf(context).width;
      height = width * (13 / 70);
    } else {
      width = this.width!;
      height = this.height!;
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 2,
            offset: Offset(0, 4),
            spreadRadius: 0,
          ),
        ],
      ),
      child: TextFormField(
        validator: (value) {
          if (isPassword == true) {
            if (value == null || value.isEmpty || value.length <= 1) {
              return 'Invalid Password';
            }
          } else if (isPassword == false) {
            if (value == null || value.isEmpty || value.length <= 1) {
              return 'Invalid Email';
            }
          }
          return null;
        },
        keyboardType: keyboardType,
        obscuringCharacter: passwordCharacter!,
        obscureText: isPassword!,
        cursorColor: Colors.grey,
        style: TextStyle(
          fontSize: 20,
          color: Colors.black,
          fontWeight: fontWeight,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(
            top: height / 2.5,
            left: this.width ?? 15,
            right: this.width ?? 15,
          ),
          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 20,
            color: Color(0xFFB5B5B5),
          ),
          prefixIcon: prefixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(radius)),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(radius)),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
