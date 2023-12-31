
import 'package:driver_app/Utils/colors.dart';
import 'package:driver_app/Utils/sizedBox.dart';
import 'package:driver_app/authentication/car_Info_screen.dart';
// import 'package:driver_app/authentication/car_Info_screen.dart';
import 'package:driver_app/authentication/login_screen.dart';
import 'package:driver_app/widgest/progress_dialog.dart';
import 'package:driver_app/widgest/textField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../global/global.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  validateForm() {
    if (nameController.text.length < 3) {
      Fluttertoast.showToast(msg: "Name must be atleast 3 characters");
    } else if (!emailController.text.contains("@")) {
      Fluttertoast.showToast(msg: "Invalid email address");
    } else if (phoneController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Phone number is required");
    } else if (passwordController.text.length < 6) {
      Fluttertoast.showToast(msg: "Password must be atleast 6 characters");
    } else {
      saveDriverInfoNow();
    }
  }

  saveDriverInfoNow() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return ProgressDialog(message: "Processing, Please wait..");
        });

    final User? firebseUser = (await fAuth
            .createUserWithEmailAndPassword(
                email: emailController.text.trim(),
                password: passwordController.text.trim())
            .catchError((msg) {
      Navigator.pop(context);
      Fluttertoast.showToast(msg: "Error: $msg");
    }))
        .user;

    if (firebseUser != null) {
      Map driversMap = {
        "id": firebseUser.uid,
        "name": nameController.text.trim(),
        "email": emailController.text.trim(),
        "phone": phoneController.text.trim(),
      };

      DatabaseReference dericersRef =
          FirebaseDatabase.instance.ref().child("drivers");
      dericersRef.child(firebseUser.uid).set(driversMap);

      currentFirebaseUser = firebseUser;
      Fluttertoast.showToast(msg: "Account has been created!!");
      // ignore: use_build_context_synchronously
      Navigator.push(context, MaterialPageRoute(builder: (context)=>CarInfoScreen()));
    } else {
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
      Fluttertoast.showToast(msg: "Account has not been created!!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset("assets/img1.png"),
              ),
              Text(
                "Register as a Driver",
                style: TextStyle(
                    fontSize: 26, color: wColor, fontWeight: FontWeight.bold),
              ),
              DriverTextField(
                controller: nameController,
                hintText: "Enter your name",
                lableText: "Name",
                keyBoardType: TextInputType.name,
                maxLength: 30,
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
                controller: phoneController,
                hintText: "Enter your phone number",
                lableText: "Phone Number",
                keyBoardType: TextInputType.phone,
                maxLength: 10,
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
                  validateForm();
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => CarInfoScreen(),
                  //   ),
                  // );
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: Text(
                    "Create Account",
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: Text(
                    "Already have an Account? Login Here",
                    style: TextStyle(color: gColor),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
