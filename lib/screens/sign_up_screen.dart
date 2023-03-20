import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hivefitx/constants.dart';
import 'package:hivefitx/screens/data_screens/registration_page1.dart';
import 'package:hivefitx/screens/login_screen.dart';
import 'package:hivefitx/services/firebase_services.dart';
import 'package:hivefitx/utils/app_title.dart';
import 'package:hivefitx/utils/button.dart';
import 'package:validators/validators.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
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
                  // name textField
                  TextFormField(
                    controller: nameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter a valid name';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.name,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(24),
                    ],
                    decoration: InputDecoration(
                      hintText: 'Name',
                      labelText: 'Name',
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
                        Icons.person_outlined,
                        color: Constants.primaryColor,
                      ),
                    ),
                  ),
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
                    height: 20,
                  ),
                  // confirm password textField
                  TextFormField(
                    controller: confirmPasswordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter a valid password';
                      } else if (value.length < 8) {
                        return 'password must contains 8 characters';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    obscureText: !isConfirmPasswordVisible,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Confirm Password',
                      labelText: 'Confirm Password',
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
                            isConfirmPasswordVisible = !isConfirmPasswordVisible;
                          });
                        },
                        icon: !isConfirmPasswordVisible
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
                  Button(
                    btnText: 'Create Account',
                    onTap: () {
                      if (_formKey.currentState!.validate() &&
                          passwordController.text ==
                              confirmPasswordController.text) {
                        FirebaseServices().createAcoount(
                          email: emailController.text,
                          password: passwordController.text,
                          name: nameController.text,
                        );
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegistrationPage1(),
                          ),
                        );
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
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
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'Login',
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
      ),
    );
  }
}
