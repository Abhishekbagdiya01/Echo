import 'package:echo/screens/user_onboarding/login_screen.dart';
import 'package:echo/screens/user_onboarding/widgets/custom_shape.dart';
import 'package:echo/screens/user_onboarding/widgets/form_field.dart';
import 'package:echo/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../widgets/text_styles.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController firstNController = TextEditingController();

  TextEditingController lastNController = TextEditingController();

  TextEditingController usernameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPassController = TextEditingController();
  int selectedERadio = 0;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            UpperShape(),
            Text("Create Account",
                style: interTextStyle(
                    color: Color.fromARGB(255, 103, 103, 91),
                    fontSize: 24,
                    fontWeight: FontWeight.bold)),
            Container(
              padding: EdgeInsets.symmetric(horizontal: width * 0.10),
              child: Column(
                children: [
                  InputFormField(
                    controller: firstNController,
                    hintText: "First name",
                  ),
                  InputFormField(
                    controller: lastNController,
                    hintText: "Last name",
                  ),
                  InputFormField(
                    controller: usernameController,
                    hintText: "Username",
                  ),
                  InputFormField(
                    controller: emailController,
                    hintText: "Email",
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: width * 0.4,
                        child: RadioListTile(
                          title: Text("Male",
                              style: interTextStyle(
                                  color: blackColor.withOpacity(.7))),
                          value: 1,
                          groupValue: selectedERadio,
                          onChanged: (value) {
                            setState(() {
                              selectedERadio = value!;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        width: width * 0.4,
                        child: RadioListTile(
                          title: Text(
                            "Female",
                            style: interTextStyle(
                                color: blackColor.withOpacity(.7)),
                          ),
                          value: 2,
                          groupValue: selectedERadio,
                          onChanged: (value) {
                            setState(() {
                              selectedERadio = value!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  InputFormField(
                    controller: emailController,
                    hintText: "Password",
                    isPasswordField: true,
                  ),
                  InputFormField(
                    controller: emailController,
                    hintText: "Confirm password",
                    isPasswordField: true,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomButton(voidCallback: () {}, title: "SignUp"),
                  Row(
                    children: [
                      Text(
                        "Already have an account ?",
                        style: interTextStyle(color: topLogoColor),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ));
                        },
                        child: Text(
                          "Login",
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
