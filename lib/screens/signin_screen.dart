import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mysql_utils/mysql_utils.dart';
import 'package:pharmix/Utilities/colors.dart';
import 'package:pharmix/data/data_query.dart';
import 'package:pharmix/models/user.dart';
import 'package:pharmix/providers/user_provider.dart';
import 'package:pharmix/screens/tab_screen.dart';
import 'package:pharmix/widgets/api_bar.dart';
import 'package:pharmix/widgets/custom_app_bar.dart';
import 'package:pharmix/widgets/blue_button.dart';
import 'package:pharmix/widgets/text_bar.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  String? _emailTextValidator;
  String? _passwordTextValidator;

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    password.dispose();
  }

  Future<String?> _emailValidate() async {
    if (await findEmail(email.text) == false) {
      return 'Email not found';
    }
    return null;
  }

  Future<(String?, ResultFormat?)> _passwordValidate() async {
    var result = await findPassword(email.text, password.text);
    if (result.$1 == false) {
      return ('Incorrect password', null);
    }
    return (null, result.$2);
  }

  Future<bool> _checkInputs() async {
    var validateEmail = await _emailValidate();
    var validatePassword = await _passwordValidate();
    if (validateEmail != null) {
      setState(() {
        _emailTextValidator = validateEmail;
      });
    } else {
      setState(() {
        _emailTextValidator = null;
      });
    }
    if (validatePassword.$1 != null) {
      setState(() {
        _passwordTextValidator = validatePassword.$1;
      });
    } else {
      setState(() {
        _passwordTextValidator = null;
      });
    }

    if (_formKey.currentState!.validate()) {
      ref.read(userNotifier.notifier).updateUser(User(
            userID: validatePassword.$2!.rows[0]['user_id'],
            fname: validatePassword.$2!.rows[0]['first_name'],
            lname: validatePassword.$2!.rows[0]['last_name'],
            email: validatePassword.$2!.rows[0]['email'],
            password: validatePassword.$2!.rows[0]['password'],
          ));
      return true;
    }

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
                TextBar(
                  hintText: 'Email',
                  prefixIcon: const Icon(
                    Icons.email_rounded,
                    color: Color(0xFFB5B5B5),
                  ),
                  radius: 15,
                  keyboardType: TextInputType.emailAddress,
                  validator: () {
                    return _emailTextValidator;
                  },
                  textEditingController: email,
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
                  validator: () {
                    return _passwordTextValidator;
                  },
                  textEditingController: password,
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
                const Padding(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      APIBar(
                        signType: 'apple',
                        isIn: true,
                      ),
                      Spacer(),
                      APIBar(
                        signType: 'google',
                        isIn: true,
                      ),
                      Spacer(),
                      APIBar(
                        signType: 'facebook',
                        isIn: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
