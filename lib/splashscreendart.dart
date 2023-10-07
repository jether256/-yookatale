import 'dart:async';

import 'package:flutter/material.dart';

import 'constants/color.dart';
import 'login-signupscreens/login/login.dart';
import 'main-navigatinon/dashboard.dart';

class SplachScreen extends StatefulWidget {

  static const  String id='splash';

  const SplachScreen({super.key});

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {


  @override
  void initState() {


    Timer( const Duration(seconds: 3,),(){


      Navigator.pushReplacementNamed(context,Dashboard.id);


    });

    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ClipRRect(
        child: Container(
          decoration:const BoxDecoration(
           // color: Colors.black.withOpacity(0.2),
            image:DecorationImage(
              image: AssetImage("assets/images/veg.png"),
              fit: BoxFit.cover,
              alignment: Alignment(-0.3, 0),
            )
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [backgroundColor.withOpacity(0.8),backgroundColor.withOpacity(0.8)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.7,1],
              )
            ),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  Image.asset('assets/images/loo.png',height: 200,),
                  const SizedBox(height: 10,),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
