import 'package:echo/bloc/auth_bloc/auth_bloc.dart';
import 'package:echo/bloc/credential_cubit/credential_cubit_bloc.dart';
import 'package:echo/bloc/user_bloc/user_bloc_bloc.dart';
import 'package:echo/route/on_generated_routes.dart';
import 'package:echo/screens/splash_screen/splash_screen.dart';
import 'package:echo/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => CredentialCubitBloc(),
    ),
    BlocProvider(
      create: (context) => AuthBloc(),
    ),
    BlocProvider(
      create: (context) => UserBloc(),
    )
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        useMaterial3: true,
      ),
      onGenerateRoute: OnGeneratedRoutes.route,
      routes: {
        "/": (context) {
          return SplashScreen();
        }
      },
    );
  }
}
