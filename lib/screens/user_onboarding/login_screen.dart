import 'package:echo/route/page_const.dart';
import 'package:echo/screens/user_onboarding/forgot_password_screen.dart';
import 'package:echo/screens/user_onboarding/signup_screen.dart';
import 'package:echo/screens/user_onboarding/widgets/custom_shape.dart';
import 'package:echo/screens/user_onboarding/widgets/form_field.dart';
import 'package:echo/utils/colors.dart';
import 'package:echo/widgets/text_styles.dart';

import 'package:flutter/material.dart';

import '../../widgets/custom_button.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomShape(height: 250),
            Text("Welcome back!",
                style: interTextStyle(
                    color: Color.fromARGB(255, 103, 103, 91),
                    fontSize: 24,
                    fontWeight: FontWeight.bold)),
            Text("Login to your account",
                style: interTextStyle(
                    color: Color.fromARGB(255, 103, 103, 91).withOpacity(.6),
                    fontSize: 14,
                    fontWeight: FontWeight.bold)),
            Container(
              padding: EdgeInsets.symmetric(horizontal: width * 0.10),
              child: Column(
                children: [
                  InputFormField(
                    controller: usernameController,
                    hintText: "Username",
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  InputFormField(
                    controller: passwordController,
                    hintText: "Password",
                    isPasswordField: true,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, PageConst.ForgotPasswordScreen);
                      },
                      child: Text(
                        "Forget password ?",
                        style: interTextStyle(color: goldenThemeColor),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  CustomButton(
                    title: "Login",
                    voidCallback: () {},
                  ),
                  Row(
                    children: [
                      Text(
                        "Don't have an account ?",
                        style: interTextStyle(color: goldenThemeColor),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUpScreen(),
                              ));
                        },
                        child: Text(
                          "Create Account",
                          style: interTextStyle(
                              color: Colors.brown, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
