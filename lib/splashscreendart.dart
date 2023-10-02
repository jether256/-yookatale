import 'dart:async';

import 'package:flutter/material.dart';

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
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            Image.asset('assets/images/logo.png',height: 200,),
            const SizedBox(height: 10,),

          ],
        ),
      ),
    );
  }
}
