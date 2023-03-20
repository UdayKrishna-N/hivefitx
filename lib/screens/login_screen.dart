import 'package:flutter/material.dart';
import 'package:hivefitx/constants.dart';
import 'package:hivefitx/screens/sign_up_screen.dart';
import 'package:hivefitx/services/firebase_services.dart';
import 'package:hivefitx/utils/app_title.dart';
import 'package:hivefitx/utils/button.dart';
import 'package:validators/validators.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  bool isPasswordVisible = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppTitle(),
                SizedBox(
                  height: 20,
                ),
                // email textField
                TextFormField(
                  controller: emailController,
                  validator: (value) =>
                      !isEmail(value!) ? 'Invalid Email' : null,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Email',
                    labelText: 'Email',
                    floatingLabelStyle: TextStyle(
                      color: Constants.primaryColor,
                      letterSpacing: 1.5,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    hintStyle: TextStyle(
                      color: Colors.white60,
                      letterSpacing: 1.5,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    labelStyle: TextStyle(
                      color: Colors.white60,
                      letterSpacing: 1.5,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    focusedBorder: Constants().border,
                    enabledBorder: Constants().border,
                    errorBorder: Constants().border,
                    focusedErrorBorder: Constants().border,
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: Constants.primaryColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                // password textField
                TextFormField(
                  controller: passwordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter a valid password';
                    } else if (value.length < 8) {
                      return 'password must contains 8 characters';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
                  obscureText: !isPasswordVisible,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Password',
                    labelText: 'Password',
                    floatingLabelStyle: TextStyle(
                      color: Constants.primaryColor,
                      letterSpacing: 1.5,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    hintStyle: TextStyle(
                      color: Colors.white60,
                      letterSpacing: 1.5,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    labelStyle: TextStyle(
                      color: Colors.white60,
                      letterSpacing: 1.5,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    focusedBorder: Constants().border,
                    enabledBorder: Constants().border,
                    errorBorder: Constants().border,
                    focusedErrorBorder: Constants().border,
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      color: Constants.primaryColor,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                      icon: !isPasswordVisible
                          ? Icon(
                              Icons.visibility_off_outlined,
                              color: Colors.grey.shade700,
                            )
                          : Icon(
                              Icons.visibility_outlined,
                              color: Constants.primaryColor,
                            ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Button(btnText: 'Login',onTap: () {
                  if (_formKey.currentState!.validate()) {
                    FirebaseServices().signIn(
                      email: emailController.text.trim(),
                      password: passwordController.text.trim(),
                    );
                  }
                },),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account yet?',
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(
                          color: Constants.primaryColor.withOpacity(0.8),
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
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
