import 'package:driver_app/Splashscreen/splash_screen.dart';
import 'package:driver_app/Utils/colors.dart';
import 'package:driver_app/authentication/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../Utils/sizedBox.dart';
import '../global/global.dart';
import '../widgest/progress_dialog.dart';
import '../widgest/textField.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

   validateForm() {
     if (!emailController.text.contains("@")) {
      Fluttertoast.showToast(msg: "Invalid email address");
    }  else if (passwordController.text.isNotEmpty) {
      Fluttertoast.showToast(msg: "Password is required");
    } else {
      loginDriver();
    }
  }
loginDriver() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return ProgressDialog(message: "Processing, Please wait..");
        });

    final User? firebseUser = (await fAuth
            .signInWithEmailAndPassword(
                email: emailController.text.trim(),
                password: passwordController.text.trim())
            .catchError((msg) {
      Navigator.pop(context);
      Fluttertoast.showToast(msg: "Error: $msg");
    }))
        .user;

    if (firebseUser != null) {
      currentFirebaseUser = firebseUser;
      Fluttertoast.showToast(msg: "Login Successful!!");
      // ignore: use_build_context_synchronously
      Navigator.push(context, MaterialPageRoute(builder: (context)=>SplashScreen()));
    } else {
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
      Fluttertoast.showToast(msg: "Error occured during Login!!");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.asset("assets/img1.png"),
                ),
                Text(
                  "Login as a Driver",
                  style: TextStyle(
                      fontSize: 26, color: wColor, fontWeight: FontWeight.bold),
                ),
                height20,
                DriverTextField(
                  controller: emailController,
                  hintText: "Enter your email",
                  lableText: "Email",
                  keyBoardType: TextInputType.emailAddress,
                  maxLength: 30,
                ),
                height20,
                DriverTextField(
                  controller: passwordController,
                  hintText: "Enter your password",
                  lableText: "Password",
                  keyBoardType: TextInputType.visiblePassword,
                  isObsecure: true,
                  maxLength: 16,
                ),
                height40,
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: wColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      )),
                  onPressed: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>CarInfoScreen(),),);
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 18,
                        color: bColor.withOpacity(0.6),
                      ),
                    ),
                  ),
                ),
                height20,
                TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupScreen()));
                    },
                    child: Text("Don't have an Account? Register Here",style: TextStyle(
                      color: gColor
                    ),))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
