import 'package:flutter/material.dart';
import 'package:pharmix/Utilities/colors.dart';
import 'package:pharmix/screens/tab_screen.dart';
import 'package:pharmix/widgets/api_bar.dart';
import 'package:pharmix/widgets/custom_app_bar.dart';
import 'package:pharmix/widgets/blue_button.dart';
import 'package:pharmix/widgets/text_bar.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();

  bool _checkInputs() {
    if (_formKey.currentState!.validate()) return true;

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: const CustomAppBar(title: 'Sign In'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Welcome\nBack',
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Sing In to continue',
                  style: TextStyle(
                    color: Color(0xFF878787),
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(height: 40),
                const TextBar(
                  hintText: 'Email',
                  prefixIcon: Icon(
                    Icons.email_rounded,
                    color: Color(0xFFB5B5B5),
                  ),
                  radius: 15,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 20),
                const TextBar(
                  hintText: 'Password',
                  prefixIcon: Icon(
                    Icons.password_rounded,
                    color: Color(0xFFB5B5B5),
                  ),
                  radius: 15,
                  isPassword: true,
                  fontWeight: FontWeight.bold,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        foregroundColor: MaterialStateColor.resolveWith(
                            (states) => const Color(0xFF878787)),
                        textStyle: MaterialStateTextStyle.resolveWith(
                          (states) => const TextStyle(color: Colors.black),
                        ),
                        overlayColor: MaterialStateColor.resolveWith(
                            (states) => Colors.transparent),
                        padding: MaterialStateProperty.resolveWith(
                            (states) => EdgeInsets.zero)),
                    child: const Text(
                      'Forget Password?',
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height / 13,
                  child: BlueButton(
                    title: 'Sign In',
                    chosenScreen: const TabScreen(),
                    checkInputs: _checkInputs,
                    fontSize: 25,
                    radiusCurve: 15,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: 108,
                        decoration: const ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1,
                              strokeAlign: BorderSide.strokeAlignCenter,
                              color: Color(0xFF5C5C5C),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      'Or Sign In with',
                      style: TextStyle(
                        color: Color(0xFF5C5C5C),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      width: 108,
                      decoration: const ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1,
                            strokeAlign: BorderSide.strokeAlignCenter,
                            color: Color(0xFF5C5C5C),
                            // color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    APIBar(
                      signType: 'apple',
                      isIn: true,
                    ),
                    APIBar(
                      signType: 'google',
                      isIn: true,
                    ),
                    APIBar(
                      signType: 'facebook',
                      isIn: true,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
