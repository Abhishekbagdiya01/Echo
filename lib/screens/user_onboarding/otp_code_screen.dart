import 'dart:developer';

import 'package:echo/screens/user_onboarding/set_new_password_screen.dart';

import 'package:echo/screens/user_onboarding/signup_screen.dart';
import 'package:echo/screens/user_onboarding/widgets/custom_shape.dart';

import 'package:echo/utils/colors.dart';
import 'package:echo/widgets/text_styles.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../widgets/custom_button.dart';

class OtpCodeScreen extends StatelessWidget {
  OtpCodeScreen({required this.userEmail});
  final String userEmail;
  String otp = "";
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            UpperShape(),
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
                  Form(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 68,
                        width: 64,
                        child: TextField(
                          textAlign: TextAlign.center,
                          onChanged: (value) {
                            if (value.length == 1) {
                              otp = otp + value;
                              log(otp);
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1)
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 68,
                        width: 64,
                        child: TextField(
                          textAlign: TextAlign.center,
                          onChanged: (value) {
                            if (value.length == 1) {
                              otp = otp + value;
                              log(otp);
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1)
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 68,
                        width: 64,
                        child: TextField(
                          textAlign: TextAlign.center,
                          onChanged: (value) {
                            if (value.length == 1) {
                              otp = otp + value;
                              log(otp);
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1)
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 68,
                        width: 64,
                        child: TextField(
                          textAlign: TextAlign.center,
                          onChanged: (value) {
                            if (value.length == 1) {
                              otp = otp + value;
                              log(otp);
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1)
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 68,
                        width: 64,
                        child: TextField(
                          textAlign: TextAlign.center,
                          onChanged: (value) {
                            if (value.length == 1) {
                              otp = otp + value;
                              log(otp);
                            }
                          },
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1)
                          ],
                        ),
                      ),
                    ],
                  )),
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
            SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.50,
                child: BottomShape())
          ],
        ),
      ),
    );
  }
}
