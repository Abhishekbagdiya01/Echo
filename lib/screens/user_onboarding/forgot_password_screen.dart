import 'package:echo/screens/user_onboarding/otp_code_screen.dart';
import 'package:echo/screens/user_onboarding/widgets/custom_shape.dart';
import 'package:echo/screens/user_onboarding/widgets/form_field.dart';
import 'package:echo/widgets/snackbar.dart';
import 'package:echo/widgets/text_styles.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_button.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            UpperShape(),
            SizedBox(
              height: 10,
            ),
            Text(
              "Forgot password",
              style: interTextStyle(
                  color: Color.fromARGB(255, 103, 103, 91),
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: InputFormField(
                controller: emailController,
                hintText: "E-mail",
                inputType: TextInputType.emailAddress,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            CustomButton(
              title: "Send",
              voidCallback: () {
                if (emailController.text.isNotEmpty) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            OtpCodeScreen(userEmail: emailController.text),
                      ));
                } else {
                  snackbarMessenger(context, "Please fill the email field");
                }
              },
            ),
            BottomShape()
          ],
        ),
      ),
    );
  }
}
