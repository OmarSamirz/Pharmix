import 'package:flutter/material.dart';

//ignore: must_be_immutable
class TextBar extends StatefulWidget {
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
    this.textEditingController,
    this.validator = defaultValidator,
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
  final TextEditingController? textEditingController;
  final String? Function() validator;

  static String? defaultValidator() {
    // Your default validation logic here
    return null; // Return null if input is valid, otherwise return an error message
  }

  @override
  State<TextBar> createState() => _TextBarState();
}

class _TextBarState extends State<TextBar> {
  @override
  Widget build(BuildContext context) {
    double width = 0.0;
    double height = 0.0;
    if (widget.width == null && widget.height == null) {
      width = MediaQuery.sizeOf(context).width;
      height = width * (13 / 70);
    } else {
      width = widget.width!;
      height = widget.height!;
    }

    return Stack(
      children: [
        Container(
          height: height / 1.26,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
            boxShadow: const [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 2,
                offset: Offset(0, 4),
                spreadRadius: 0,
              ),
            ],
          ),
        ),
        TextFormField(
          validator: (value) {
            return widget.validator();
          },
          controller: widget.textEditingController,
          keyboardType: widget.keyboardType,
          obscuringCharacter: widget.passwordCharacter!,
          obscureText: widget.isPassword!,
          cursorColor: Colors.grey,
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: widget.fontWeight,
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(
              top: height / 2.5,
              left: widget.width ?? 15,
              right: widget.width ?? 15,
            ),
            filled: true,
            fillColor: Colors.white,
            hintText: widget.hintText,
            hintStyle: const TextStyle(
              fontSize: 20,
              color: Color(0xFFB5B5B5),
            ),
            prefixIcon: widget.prefixIcon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
