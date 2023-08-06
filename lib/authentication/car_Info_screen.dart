import 'package:driver_app/Splashscreen/splash_screen.dart';
import 'package:driver_app/Utils/colors.dart';
import 'package:driver_app/global/global.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../Utils/sizedBox.dart';
import '../widgest/textField.dart';

class CarInfoScreen extends StatefulWidget {
  const CarInfoScreen({super.key});

  @override
  State<CarInfoScreen> createState() => _CarInfoScreenState();
}

class _CarInfoScreenState extends State<CarInfoScreen> {
  TextEditingController carNameController = TextEditingController();
  TextEditingController carNumberController = TextEditingController();
  TextEditingController carColorController = TextEditingController();

  List<String> carTypeList = ["Uber-X", "Uber-Go", "Bike"];

  String? selectedCarType;
  saveCarInfo() {
    Map driverCarInfosMap = {
      "car_color": carColorController.text.trim(),
      "car_number": carNumberController.text.trim(),
      "car_model": carNameController.text.trim(),
      "type": selectedCarType,
    };

    DatabaseReference dericersRef =
        FirebaseDatabase.instance.ref().child("drivers");
    dericersRef
        .child(currentFirebaseUser!.uid)
        .child("car_details")
        .set(driverCarInfosMap);

    Fluttertoast.showToast(msg: "Car details has been saved.Congratulations!!");
    Navigator.push(context, MaterialPageRoute(builder: (context)=>SplashScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset("assets/img1.png"),
              ),
              Text(
                "Write Car Details",
                style: TextStyle(
                    fontSize: 26, color: wColor, fontWeight: FontWeight.bold),
              ),
              height30,
              DriverTextField(
                controller: carNameController,
                hintText: "Enter car name",
                lableText: "Car Name",
                keyBoardType: TextInputType.name,
                maxLength: 30,
              ),
              height20,
              DriverTextField(
                controller: carNumberController,
                hintText: "Enter car number",
                lableText: "Car Number",
                keyBoardType: TextInputType.text,
                maxLength: 30,
              ),
              height20,
              DriverTextField(
                controller: carColorController,
                hintText: "Enter car color",
                lableText: "Car Color",
                keyBoardType: TextInputType.text,
                maxLength: 10,
              ),
              height20,
              DropdownButton(
                  iconSize: 20,
                  dropdownColor: bColor.withOpacity(0.3),
                  hint: Text(
                    "Please choose car type",
                    style: TextStyle(color: gColor, fontSize: 14),
                  ),
                  value: selectedCarType,
                  items: carTypeList.map((car) {
                    return DropdownMenuItem(
                      value: car,
                      child: Text(
                        car,
                        style: TextStyle(color: gColor),
                      ),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      selectedCarType = newValue.toString();
                    });
                  }),
              height60,
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: wColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    )),
                onPressed: () {
                  if (carColorController.text.isNotEmpty &&
                      carNumberController.text.isNotEmpty &&
                      carNameController.text.isNotEmpty &&
                      selectedCarType != null) {
                    saveCarInfo();
                  }
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>CarInfoScreen(),),);
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: Text(
                    "Save Details",
                    style: TextStyle(
                      fontSize: 18,
                      color: bColor.withOpacity(0.6),
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
