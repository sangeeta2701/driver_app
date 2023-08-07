import 'package:driver_app/Splashscreen/splash_screen.dart';
import 'package:driver_app/global/global.dart';
import 'package:flutter/material.dart';

class ProfileTabPage extends StatefulWidget {
  const ProfileTabPage({super.key});

  @override
  State<ProfileTabPage> createState() => _ProfileTabPageState();
}

class _ProfileTabPageState extends State<ProfileTabPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              fAuth.signOut();
              Navigator.push(context, MaterialPageRoute(builder: (context)=>SplashScreen(),),);
            },
            child: Text("Sign Out")),
      ),
    );
  }
}
