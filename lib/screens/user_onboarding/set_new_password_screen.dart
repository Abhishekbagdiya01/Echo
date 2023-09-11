import 'dart:developer';

import 'package:echo/route/page_const.dart';
import 'package:echo/screens/user_onboarding/forgot_password_screen.dart';
import 'package:echo/screens/user_onboarding/signup_screen.dart';
import 'package:echo/screens/user_onboarding/widgets/custom_shape.dart';
import 'package:echo/screens/user_onboarding/widgets/form_field.dart';
import 'package:echo/utils/colors.dart';
import 'package:echo/widgets/snackbar.dart';
import 'package:echo/widgets/text_styles.dart';

import 'package:flutter/material.dart';

import '../../widgets/custom_button.dart';

class SetNewPasswordScreen extends StatelessWidget {
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomShape(height: 250),
            Text("New Password",
                style: interTextStyle(
                    color: Color.fromARGB(255, 103, 103, 91),
                    fontSize: 24,
                    fontWeight: FontWeight.bold)),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  InputFormField(
                    controller: newPasswordController,
                    hintText: "New Password",
                    isPasswordField: true,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  InputFormField(
                    controller: confirmPasswordController,
                    hintText: "Confirm Password",
                    isPasswordField: true,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  CustomButton(
                    title: "Save",
                    voidCallback: () {
                      if (newPasswordController.text.isNotEmpty &&
                          confirmPasswordController.text.isNotEmpty) {
                        if (newPasswordController.text ==
                            confirmPasswordController.text) {
                          log("Login success");
                        } else {
                          snackbarMessenger(context,
                              "New password and confirm password did not match");
                        }
                      } else {
                        snackbarMessenger(context, "Field cannot be empty");
                      }
                    },
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
