import 'package:driver_app/Utils/colors.dart';
import 'package:driver_app/Utils/sizedBox.dart';
import 'package:driver_app/widgest/textField.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 16),
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
              DriverTextField(controller: nameController, hintText: "Enter your name", lableText: "Name",keyBoardType: TextInputType.name,maxLength: 30,),
              height20,
              DriverTextField(controller: emailController, hintText: "Enter your email", lableText: "Email",keyBoardType: TextInputType.emailAddress,maxLength: 30,),
              height20,
              DriverTextField(controller: phoneController, hintText: "Enter your phone number", lableText: "Phone Number",keyBoardType: TextInputType.phone,maxLength: 10,),
              height20,
              DriverTextField(controller: passwordController, hintText: "Enter your password", lableText: "Password",keyBoardType: TextInputType.visiblePassword,isObsecure: true,maxLength: 16,),

              height40,
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: wColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  )
                ),
                onPressed: (){}, child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
                  child: Text("Create Account",style: TextStyle(
                  fontSize: 18,
                  color: bColor.withOpacity(0.6),
                              ),),
                ),),
            ],
          ),
        ),
      ),
    );
  }
}

