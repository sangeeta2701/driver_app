import 'dart:async';

import 'package:driver_app/Utils/colors.dart';
import 'package:driver_app/Utils/sizedBox.dart';
import 'package:driver_app/authentication/login_screen.dart';
import 'package:driver_app/global/global.dart';
import 'package:driver_app/mainScreens/main_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTimer() {
    Timer(Duration(seconds: 6), () async {
      if (await fAuth.currentUser != null) {
        currentFirebaseUser = fAuth.currentUser;
        // ignore: use_build_context_synchronously
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MainScreen()));
      } else {
        // ignore: use_build_context_synchronously
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
      }
      //home page
    });
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: bColor,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset("assets/img1.png"),
          height20,
          Text(
            "Uber Clone App",
            style: TextStyle(
                fontSize: 20,
                color: wColor,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none),
          )
        ]),
      ),
    );
  }
}
