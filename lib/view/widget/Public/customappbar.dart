import 'package:flutter/material.dart';
import 'package:mozaeapp/content/appcolor.dart';

class Customappbar extends StatelessWidget {
  const Customappbar({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Appcolor.background,
            fontFamily: "Cairo",
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Appcolor.basic,
      toolbarHeight: 100,
    );
  }
}
