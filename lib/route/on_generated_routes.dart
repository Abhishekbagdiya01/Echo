import 'package:echo/responsive/responsive_layout.dart';
import 'package:echo/route/page_const.dart';
import 'package:echo/screens/home_screen.dart';
import 'package:echo/screens/profile_screen.dart';
import 'package:echo/screens/search_screen.dart';
import 'package:echo/screens/splash_screen/splash_screen.dart';
import 'package:echo/screens/user_onboarding/forgot_password_screen.dart';
import 'package:echo/screens/user_onboarding/login_screen.dart';
import 'package:echo/screens/user_onboarding/signup_screen.dart';
import 'package:echo/screens/upload_post_screen.dart';
import 'package:flutter/material.dart';

class OnGeneratedRoutes {
  static Route<dynamic> route(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case PageConst.SignUpScreen:
        {
          return MaterialPageRoute(
            builder: (_) => SignUpScreen(),
          );
        }
      case PageConst.LoginScreen:
        {
          return MaterialPageRoute(
            builder: (_) => LoginScreen(),
          );
        }
      case PageConst.ForgotPasswordScreen:
        {
          return MaterialPageRoute(
            builder: (_) => ForgotPasswordScreen(),
          );
        }
      case PageConst.HomeScreen:
        {
          return MaterialPageRoute(
            builder: (_) => HomeScreen(),
          );
        }
      case PageConst.UploadPostScreen:
        {
          return MaterialPageRoute(
            builder: (_) => UploadPostScreen(),
          );
        }
      case PageConst.SearchScreen:
        {
          return MaterialPageRoute(
            builder: (_) => SearchScreen(),
          );
        }
      case PageConst.ProfileScreen:
        {
          return MaterialPageRoute(
            builder: (_) => ProfileScreen(),
          );
        }
      case PageConst.ResponsiveLayout:
        {
          return MaterialPageRoute(
            builder: (_) => ResponsiveLayout(),
          );
        }
      default:
        {
          return MaterialPageRoute(
            builder: (_) => ErrorScreen(),
          );
        }
    }
  }
}

class ErrorScreen extends StatelessWidget {
  ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Text("Something went wrong")),
        MaterialButton(
          child: Text("Jump to Home screen"),
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => SplashScreen(),
                ));
          },
        )
      ],
    ));
  }
}
