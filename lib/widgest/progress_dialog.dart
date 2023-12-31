import 'package:driver_app/Utils/colors.dart';
import 'package:driver_app/Utils/sizedBox.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProgressDialog extends StatelessWidget {
   ProgressDialog({super.key,required this.message});
  String message;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: bColor.withOpacity(0.4),
      child: Container(
        margin: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: wColor,
          borderRadius: BorderRadius.circular(6)
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(children: [
width4,
CircularProgressIndicator(
  valueColor: AlwaysStoppedAnimation(gColor),
)   ,
width24,
Text(message,style: TextStyle(
  color: gColor,
  fontSize: 12
),)
       ]),
        ),
      ),
    );
  }
}
