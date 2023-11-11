import 'package:echo/bloc/auth_bloc/auth_bloc.dart';
import 'package:echo/bloc/credential_cubit/credential_cubit_bloc.dart';
import 'package:echo/model/user_model.dart';
import 'package:echo/route/page_const.dart';
import 'package:echo/screens/user_onboarding/signup_screen.dart';
import 'package:echo/screens/user_onboarding/widgets/custom_shape.dart';
import 'package:echo/screens/user_onboarding/widgets/form_field.dart';
import 'package:echo/utils/colors.dart';
import 'package:echo/widgets/snackbar.dart';
import 'package:echo/widgets/text_styles.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/custom_button.dart';

class LoginScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            UpperShape(),
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
                    controller: emailController,
                    hintText: "E-mail",
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
                  BlocListener<CredentialCubitBloc, CredentialCubitState>(
                    listener:
                        (BuildContext context, CredentialCubitState state) {
                      if (state is CredentialSuccessState) {
                        BlocProvider.of<AuthBloc>(context)
                            .add(LoggedIn(uid: state.user.uid!));
                        Navigator.pushReplacementNamed(
                            context, PageConst.ResponsiveLayout);
                      } else if (state is CredentialErrorState) {
                        snackbarMessenger(context, state.errorMessage);
                      }
                    },
                    child: CustomButton(
                      title: "Login",
                      voidCallback: () {
                        UserModel user = UserModel(
                            email: emailController.text,
                            password: passwordController.text);
                        BlocProvider.of<CredentialCubitBloc>(context)
                            .add(Login(userModel: user));
                      },
                    ),
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
            ),
            BottomShape()
          ],
        ),
      ),
    );
  }
}
