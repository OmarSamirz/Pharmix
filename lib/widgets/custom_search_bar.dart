import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pharmix/Utilities/util.dart';
import 'package:pharmix/screens/search_screen.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
    required this.isClick,
    this.showKeyboard = false,
  });

  final bool isClick;
  final bool showKeyboard;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;

    return Expanded(
      child: InkWell(
        onTap: () {
          if (!isClick) return;
          goToScreen(context, const SearchScreen(), PageTransitionType.fade);
        },
        overlayColor:
            MaterialStateColor.resolveWith((states) => Colors.transparent),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(30)),
            boxShadow: [
              BoxShadow(
                color: Color(0x3F8FBDFD),
                blurRadius: 4,
                offset: Offset(0, 3),
                spreadRadius: 2,
              ),
            ],
          ),
          child: TextFormField(
            autofocus: showKeyboard,
            enabled: !isClick,
            cursorColor: const Color(0xFF4495FE),
            style: const TextStyle(
              fontSize: 20,
              color: Color(0xFF4495FE),
              fontWeight: FontWeight.normal,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(
                top: height / 25,
                left: 0,
                right: 15,
              ),
              filled: true,
              fillColor: Colors.white,
              prefixIcon: const Icon(
                Icons.search,
                size: 30,
                color: Color(0xFF4495FE),
              ),
              hintText: 'Search Pharmix',
              hintStyle: const TextStyle(
                fontSize: 20,
                color: Color(0xFF4495FE),
              ),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide.none,
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
