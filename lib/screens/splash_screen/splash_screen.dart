import 'dart:developer';

import 'package:echo/bloc/auth_bloc/auth_bloc.dart';
import 'package:echo/route/page_const.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    BlocProvider.of<AuthBloc>(context).add(AppStart());
    // Timer(Duration(milliseconds: 3000), () {
    //   Navigator.pushReplacement(
    //       context,
    //       MaterialPageRoute(
    //         builder: (context) => SignUpScreen(),
    //       ));
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccessState) {
              if (state.uid == "") {
                log("$state");
                Navigator.pushReplacementNamed(context, PageConst.LoginScreen);
              } else {
                Navigator.pushReplacementNamed(
                    context, PageConst.ResponsiveLayout);
              }
            } else {
              Navigator.pushReplacementNamed(context, PageConst.LoginScreen);
            }
          },
          child: EchoLogo()),
    );
  }
}
