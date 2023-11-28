import 'package:flutter/material.dart';
import 'package:pharmix/Utilities/colors.dart';
import 'package:pharmix/widgets/blue_button.dart';
import 'package:pharmix/widgets/custom_app_bar.dart';
import 'package:pharmix/widgets/text_bar.dart';
import 'package:pharmix/widgets/api_bar.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: const CustomAppBar(title: 'Sign Up'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Create\nNew Account',
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Enter your details to create account',
                style: TextStyle(
                  color: Color(0xFF878787),
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(height: 30),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextBar(
                      hintText: 'First name',
                      radius: 10,
                    ),
                  ),
                  SizedBox(width: 30),
                  Expanded(
                    child: TextBar(
                      hintText: 'Last name',
                      radius: 10,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
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
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height / 13,
                child: const BlueButton(
                  title: 'Sign Up',
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
                    'Or Sign Up with',
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
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  APIBar(
                    signType: 'apple',
                    isIn: false,
                  ),
                  SizedBox(height: 20),
                  APIBar(
                    signType: 'google',
                    isIn: false,
                  ),
                  SizedBox(height: 20),
                  APIBar(
                    signType: 'facebook',
                    isIn: false,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
