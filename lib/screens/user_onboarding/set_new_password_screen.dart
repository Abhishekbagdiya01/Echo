import 'dart:developer';

import 'package:echo/bloc/credential_cubit/credential_cubit_bloc.dart';
import 'package:echo/screens/home_screen.dart';
import 'package:echo/screens/user_onboarding/login_screen.dart';
import 'package:echo/utils/shared_pref.dart';
import 'package:flutter/material.dart';

import 'package:echo/screens/user_onboarding/widgets/custom_shape.dart';
import 'package:echo/screens/user_onboarding/widgets/form_field.dart';
import 'package:echo/widgets/snackbar.dart';
import 'package:echo/widgets/text_styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/custom_button.dart';

class SetNewPasswordScreen extends StatelessWidget {
  final String userEmail;
  SetNewPasswordScreen({
    Key? key,
    required this.userEmail,
  }) : super(key: key);
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        clipBehavior: Clip.none,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            UpperShape(),
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
                  BlocListener<CredentialCubitBloc, CredentialCubitState>(
                    listener: (context, state) {
                      if (state is CredentialLoadingState) {
                        Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is CredentialSuccessMessageState) {
                        snackbarMessenger(context, state.successMessage);

                        SharedPref().setUid("");
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ));
                      } else if (state is CredentialErrorState) {
                        snackbarMessenger(context, state.errorMessage);
                      }
                    },
                    child: CustomButton(
                      title: "Save",
                      voidCallback: () {
                        if (newPasswordController.text.isNotEmpty &&
                            confirmPasswordController.text.isNotEmpty) {
                          if (newPasswordController.text ==
                              confirmPasswordController.text) {
                            log("Login success");

                            BlocProvider.of<CredentialCubitBloc>(context).add(
                                ResetPassword(
                                    email: userEmail,
                                    newPassword: newPasswordController.text));
                          } else {
                            snackbarMessenger(context,
                                "New password and confirm password did not match");
                          }
                        } else {
                          snackbarMessenger(context, "Field cannot be empty");
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
                height: MediaQuery.sizeOf(context).height * .40,
                child: BottomShape())
          ],
        ),
      ),
    );
  }
}
