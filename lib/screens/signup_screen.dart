import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pharmix/Utilities/colors.dart';
import 'package:pharmix/data/data_query.dart';
import 'package:pharmix/models/user.dart';
import 'package:pharmix/providers/user_provider.dart';
import 'package:pharmix/screens/tab_screen.dart';
import 'package:pharmix/widgets/blue_button.dart';
import 'package:pharmix/widgets/custom_app_bar.dart';
import 'package:pharmix/widgets/text_bar.dart';
import 'package:pharmix/widgets/api_bar.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  String? _emailTextValidator;

  @override
  void dispose() {
    super.dispose();
    fname.dispose();
    lname.dispose();
    email.dispose();
    password.dispose();
  }

  Future<String?> _emailValidate() async {
    if (await findEmail(email.text) == true) {
      return 'Email is taken';
    }
    return null;
  }

  Future<bool> _checkInputs() async {
    var validateEmail = await _emailValidate();
    if (validateEmail != null) {
      setState(() {
        _emailTextValidator = validateEmail;
      });
    } else {
      setState(() {
        _emailTextValidator = validateEmail;
      });
    }
    if (_formKey.currentState!.validate()) {
      var newUser = await createAccount(
          fname.text, lname.text, email.text, password.text);
      ref.read(userNotifier.notifier).updateUser(User(
            userID: newUser.$2,
            fname: fname.text,
            lname: lname.text,
            email: email.text,
            password: password.text,
          ));
      return true;
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: const CustomAppBar(title: 'Sign Up'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: Form(
            key: _formKey,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextBar(
                        hintText: 'First name',
                        radius: 10,
                        textEditingController: fname,
                        validator: () {
                          if (fname.text.trim().isEmpty) {
                            return 'Enter your first name';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 30),
                    Expanded(
                      child: TextBar(
                        hintText: 'Last name',
                        radius: 10,
                        textEditingController: lname,
                        validator: () {
                          if (lname.text.trim().isEmpty) {
                            return 'Enter your last name';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                TextBar(
                  hintText: 'Email',
                  prefixIcon: const Icon(
                    Icons.email_rounded,
                    color: Color(0xFFB5B5B5),
                  ),
                  radius: 15,
                  keyboardType: TextInputType.emailAddress,
                  textEditingController: email,
                  validator: () {
                    if (email.text.trim().isEmpty ||
                        !email.text.contains('@')) {
                      return 'Use a valid email';
                    }
                    return _emailTextValidator;
                  },
                ),
                const SizedBox(height: 20),
                TextBar(
                  hintText: 'Password',
                  prefixIcon: const Icon(
                    Icons.password_rounded,
                    color: Color(0xFFB5B5B5),
                  ),
                  radius: 15,
                  isPassword: true,
                  fontWeight: FontWeight.bold,
                  textEditingController: password,
                  validator: () {
                    if (password.text.trim().length < 6 ||
                        password.text == '') {
                      return 'Use longer password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height / 13,
                  child: BlueButton(
                    title: 'Sign Up',
                    chosenScreen: const TabScreen(),
                    fontSize: 25,
                    radiusCurve: 15,
                    checkInputs: _checkInputs,
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
      ),
    );
  }
}
