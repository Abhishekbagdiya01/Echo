import 'dart:developer';

import 'package:echo/bloc/credential_cubit/credential_cubit_bloc.dart';
import 'package:echo/screens/user_onboarding/set_new_password_screen.dart';

import 'package:echo/screens/user_onboarding/signup_screen.dart';
import 'package:echo/screens/user_onboarding/widgets/custom_shape.dart';

import 'package:echo/utils/colors.dart';
import 'package:echo/widgets/text_styles.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/snackbar.dart';

class OtpCodeScreen extends StatelessWidget {
  OtpCodeScreen({required this.userEmail});
  final String userEmail;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<TextEditingController> controllers =
      List.generate(6, (_) => TextEditingController());

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
                      key: _formKey,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          for (int i = 0; i < 6; i++)
                            SizedBox(
                              height: 68,
                              width: 60,
                              child: TextFormField(
                                controller: controllers[i],
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                onSaved: (value) {
                                  if (value != null && value.isNotEmpty) {
                                    controllers[i].text = value;
                                  } else {
                                    if (i > 0) {
                                      controllers[i - 1].text = '';
                                    }
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
                    child:
                        BlocListener<CredentialCubitBloc, CredentialCubitState>(
                      listener: (context, state) {
                        log(state.toString());
                        if (state is CredentialSuccessMessageState) {
                          snackbarMessenger(context, state.successMessage);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    SetNewPasswordScreen(userEmail: userEmail),
                              ));
                        } else if (state is CredentialErrorState) {
                          snackbarMessenger(context, state.errorMessage);
                        }
                      },
                      child: CustomButton(
                        title: "Next",
                        voidCallback: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            String enteredOTP = controllers.fold('',
                                (prev, controller) => prev + controller.text);
                            log(enteredOTP);
                            BlocProvider.of<CredentialCubitBloc>(context).add(
                                OTPVerification(
                                    email: userEmail, otp: enteredOTP));
                          }
                        },
                      ),
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
