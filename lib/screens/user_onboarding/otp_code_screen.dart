import 'package:echo/route/page_const.dart';
import 'package:echo/screens/user_onboarding/set_new_password_screen.dart';

import 'package:echo/screens/user_onboarding/signup_screen.dart';
import 'package:echo/screens/user_onboarding/widgets/custom_shape.dart';
import 'package:echo/screens/user_onboarding/widgets/form_field.dart';
import 'package:echo/utils/colors.dart';
import 'package:echo/widgets/text_styles.dart';

import 'package:flutter/material.dart';

import '../../widgets/custom_button.dart';

class OtpCodeScreen extends StatelessWidget {
  OtpCodeScreen({required this.userEmail});
  String userEmail;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomShape(height: 250),
            SizedBox(
              height: 10,
            ),
            Container(
              width: screenWidth,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("OTP Code",
                      style: interTextStyle(
                          color: Color.fromARGB(255, 103, 103, 91),
                          fontSize: 24,
                          fontWeight: FontWeight.bold)),
                  Text("We will send you an one time OTP code on ",
                      style: interTextStyle(
                          color:
                              Color.fromARGB(255, 103, 103, 91).withOpacity(.6),
                          fontSize: 14,
                          fontWeight: FontWeight.bold)),
                  Text(userEmail,
                      style: interTextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      Text(
                        "if you don't receive the code ! ",
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
                          "Resend",
                          style: interTextStyle(
                              color: Colors.brown, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: CustomButton(
                      title: "Next",
                      voidCallback: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SetNewPasswordScreen(),
                            ));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
