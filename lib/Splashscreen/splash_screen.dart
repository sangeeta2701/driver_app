import 'dart:async';

import 'package:driver_app/Utils/colors.dart';
import 'package:driver_app/mainScreens/main_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTimer() {
    Timer(Duration(seconds: 3), () async {
      //home page
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MainScreen()));
    });
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/img1.png"),
          Text("Uber Clone App",style: TextStyle(fontSize: 20,color: wColor,
          fontWeight: FontWeight.bold),)

      ]),
    );
  }
}