import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:mozaeapp/content/appcolor.dart';

class CustomLineSetting extends StatelessWidget {
  const CustomLineSetting({super.key, required this.text, required this.icon});
  final String text;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: Get.width * 0.9,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Appcolor.data,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Appcolor.black.withOpacity(0.25),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          icon,
          SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(
              fontFamily: "Cairo",
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Spacer(),
          Icon(Icons.arrow_drop_down, size: 32),
        ],
      ),
    );
  }
}
