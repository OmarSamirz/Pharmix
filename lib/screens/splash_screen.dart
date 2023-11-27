import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pharmix/Utilities/colors.dart';
import 'package:pharmix/screens/tab_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() {
    return _SplashScreen();
  }
}

class _SplashScreen extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _animationController;

  void _gotoTabScreen() {
    Navigator.of(context).pushAndRemoveUntil(
      PageTransition(
        child: const TabScreen(),
        type: PageTransitionType.fade,
      ),
      (route) => false,
    );
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 300,
      ),
    );

    _animationController.forward();
    Future.delayed(const Duration(milliseconds: 300), () {});
    _gotoTabScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Image.asset(
              'assets/images/top_left.png',
              height: 250,
            ),
          ),
          const Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Phar',
                  style: TextStyle(
                    color: Color(0xFF006BFF),
                    fontSize: 50,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
                TextSpan(
                  text: 'mix',
                  style: TextStyle(
                    color: Color(0xFFF01136),
                    fontSize: 50,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Image.asset(
              'assets/images/bottom_right.png',
              height: 200,
            ),
          ),
        ],
      ),
    );
  }
}
