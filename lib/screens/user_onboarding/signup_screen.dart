import 'package:echo/bloc/auth_bloc/auth_bloc.dart';
import 'package:echo/bloc/credential_cubit/credential_cubit_bloc.dart';
import 'package:echo/model/user_model.dart';
import 'package:echo/route/page_const.dart';

import 'package:echo/screens/user_onboarding/login_screen.dart';
import 'package:echo/screens/user_onboarding/widgets/custom_shape.dart';
import 'package:echo/screens/user_onboarding/widgets/form_field.dart';
import 'package:echo/widgets/custom_button.dart';
import 'package:echo/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                    controller: passwordController,
                    hintText: "Password",
                    isPasswordField: true,
                  ),
                  InputFormField(
                    controller: confirmPassController,
                    hintText: "Confirm password",
                    isPasswordField: true,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  BlocListener<CredentialCubitBloc, CredentialCubitState>(
                    listener: (context, state) {
                      if (state is CredentialLoadingState) {
                        Center(child: CircularProgressIndicator());
                      } else if (state is CredentialSuccessState) {
                        BlocProvider.of<AuthBloc>(context)
                            .add(LoggedIn(uid: state.user.uid!));
                        Navigator.pushReplacementNamed(
                            context, PageConst.HomeScreen);
                      } else if (state is CredentialErrorState) {
                        Center(
                          child: Text(state.errorMessage),
                        );
                      }
                    },
                    child: CustomButton(
                        voidCallback: () {
                          UserModel user = UserModel(
                              firstName: firstNController.text,
                              lastName: lastNController.text,
                              ageGroup: "18",
                              gender: selectedERadio.toString(),
                              username: usernameController.text,
                              email: emailController.text,
                              password: passwordController.text);
                          BlocProvider.of<CredentialCubitBloc>(context)
                              .add(SignUp(userModel: user));
                        },
                        title: "SignUp"),
                  ),
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
