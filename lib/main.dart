import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:yookatale/login-signupscreens/login/login.dart';
import 'package:yookatale/login-signupscreens/signup/signup.dart';
import 'package:yookatale/splashscreendart.dart';

import 'constants/color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Yookatale',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor:buttonColor),
        useMaterial3: true,
      ),
      builder:EasyLoading.init(),
      initialRoute: SplachScreen.id,// first route
      routes: {
        //routes
        SplachScreen.id:(context)=>const SplachScreen(),
        LoginScreen.id:(context)=>const LoginScreen(),
        SignUp.id:(context)=>const SignUp(),
      },

    );
  }
}

