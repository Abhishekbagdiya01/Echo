import 'package:echo/bloc/credential_cubit/credential_cubit_bloc.dart';
import 'package:echo/screens/user_onboarding/otp_code_screen.dart';
import 'package:echo/screens/user_onboarding/widgets/custom_shape.dart';
import 'package:echo/screens/user_onboarding/widgets/form_field.dart';
import 'package:echo/widgets/snackbar.dart';
import 'package:echo/widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        clipBehavior: Clip.none,
        child: Column(
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
            BlocListener<CredentialCubitBloc, CredentialCubitState>(
              listener: (context, state) {
                if (state is CredentialSuccessMessageState) {
                  snackbarMessenger(context, state.successMessage);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            OtpCodeScreen(userEmail: emailController.text),
                      ));
                } else if (state is CredentialErrorState) {
                  snackbarMessenger(context, state.errorMessage);
                }
              },
              child: CustomButton(
                title: "Send",
                voidCallback: () {
                  if (emailController.text.isNotEmpty) {
                    BlocProvider.of<CredentialCubitBloc>(context)
                        .add(ForgotPassword(email: emailController.text));
                  } else {
                    snackbarMessenger(context, "Please fill the email field");
                  }
                },
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
