import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:yookatale/login-signupscreens/login/login.dart';
import 'package:yookatale/login-signupscreens/signup/signup.dart';
import 'package:yookatale/main-navigatinon/dashboard.dart';
import 'package:yookatale/providers/cartprovider.dart';
import 'package:yookatale/providers/catepro.dart';
import 'package:yookatale/providers/productprovider.dart';
import 'package:yookatale/providers/userprovider.dart';
import 'package:yookatale/splashscreendart.dart';
import 'package:provider/provider.dart';
import 'constants/color.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  ByteData data = await PlatformAssetBundle().load('assets/ca/lets-encrypt-r3.pem');
  SecurityContext.defaultContext.setTrustedCertificatesBytes(data.buffer.asUint8List());

  Provider.debugCheckInvalidValueType=null;
  runApp(

    MultiProvider(
      providers: [

        ChangeNotifierProvider(
          create:(_) => UserProvider(),
        ),

        ChangeNotifierProvider(
          create:(_) => CategoryProductProvider(),
        ),

        ChangeNotifierProvider(
          create:(_) => CartProvider(),
        ),

        ChangeNotifierProvider(
          create:(_) => ProductProvider(),
        ),


      ],
      child: const MyApp(),
    ),

  );
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
        Dashboard.id:(context)=>const Dashboard(),
        LoginScreen.id:(context)=>const LoginScreen(),
        SignUp.id:(context)=>const SignUp(),
      },

    );
  }
}

