import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mozaeapp/content/appcolor.dart';
import 'package:mozaeapp/view/widget/OnBoarding/custom_button_onborading.dart';

class CustomeSbottomsheet extends StatelessWidget {
  const CustomeSbottomsheet({
    super.key,
    // required this.title,
    required this.textlight,
    required this.textdark,
    // required this.textbutton1,
    // required this.textbutton2,
    // required this.onPressed,
    // this.sizedBox1,
    // this.sizedBox2,
    // this.sizedBox3,
    // this.sizedBox4,
    required this.imagespathlight,
    required this.imagespathdark,
    required this.isSelectedlight,
    required this.isSelecteddark,
    required this.onTapdark,
    required this.onTaplight,
  });

  // final String title;
  final String textlight;
  final String textdark;
  // final String textbutton1;
  // final String textbutton2;
  final bool isSelectedlight;
  final bool isSelecteddark;
  final String imagespathlight;
  final String imagespathdark;
  // final void Function()? onPressed;
  final VoidCallback onTapdark;
  final VoidCallback onTaplight;

  // final SizedBox? sizedBox1;
  // final SizedBox? sizedBox2;
  // final SizedBox? sizedBox3;
  // final SizedBox? sizedBox4;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 540,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Appcolor.background,
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(height: 30),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                imagespathdark,
                height: 300,
                width: 140,
                fit: BoxFit.fill,
              ),

              Image.asset(
                imagespathlight,
                height: 300,
                width: 140,
                fit: BoxFit.fill,
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                textdark,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Cairo",
                ),
              ),
              Text(
                textlight,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Cairo",
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: [
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Radio<bool>(
                  value: true,
                  groupValue: isSelecteddark,
                  onChanged: (_) => onTapdark(),
                ),
              ),
              SizedBox(width: 100),
              Padding(
                padding: const EdgeInsets.only(right: 40),
                child: Radio<bool>(
                  value: true,
                  groupValue: isSelectedlight,
                  onChanged: (_) => onTaplight(),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
