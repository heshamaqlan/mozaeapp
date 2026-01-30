import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mozaeapp/content/appcolor.dart';

class CustomButtonOnborading extends StatelessWidget {
  const CustomButtonOnborading({
    super.key,
    required this.text,
    required this.hight,
    required this.wigth,
    required this.onpressed,
  });

  final String text;
  final double hight;
  final double wigth;
  final VoidCallback? onpressed; // لاحظ ? هنا

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      textColor: Colors.white,
      onPressed: onpressed,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      color: Appcolor.basic,
      height: hight,
      minWidth: wigth,
      child: Text(
        text.tr,
        style: const TextStyle(
          fontFamily: "Cairo",
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
