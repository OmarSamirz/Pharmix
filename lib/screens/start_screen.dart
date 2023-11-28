import 'package:flutter/material.dart';
import 'package:pharmix/Utilities/colors.dart';
import 'package:pharmix/screens/signin_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pharmix/screens/signup_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      backgroundColor: blueColor,
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                'assets/images/login_photo.png',
                height: height / 1.6,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 65),
                child: Text(
                  'Pharmix',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const Spacer(flex: 1),
          const Padding(
            padding: EdgeInsets.only(left: 25, right: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Medicine delivery',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'We deliver medicine anywhere withthe power of \nAI to recommend best medicine for you',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(flex: 2),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                PageTransition(
                    child: const SignInScreen(),
                    type: PageTransitionType.rightToLeft),
              );
            },
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(350, 65),
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: const Text(
              'Sign In',
              style: TextStyle(
                fontSize: 22,
                color: Color.fromARGB(255, 0, 107, 255),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Spacer(flex: 2),
          OutlinedButton(
            onPressed: () {
              Navigator.of(context).push(
                PageTransition(
                    child: const SignUpScreen(),
                    type: PageTransitionType.rightToLeft),
              );
            },
            style: OutlinedButton.styleFrom(
              side: const BorderSide(
                width: 3.0,
                color: Colors.white,
              ),
              fixedSize: const Size(350, 65),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: const Text(
              'Sign Up',
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}
