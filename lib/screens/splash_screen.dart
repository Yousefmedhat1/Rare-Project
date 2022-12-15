import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rare_crew_project/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});



  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 6),
            ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login()))
    );

  }
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(

        body:


        SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.black,


            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [



                Image.asset('assets/images/rare.png',fit: BoxFit.cover)














              ],
            ),
          ),
        ),




      ),
    );
  }
}
