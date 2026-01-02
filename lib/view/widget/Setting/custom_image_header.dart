import 'package:flutter/material.dart';
import 'package:mozaeapp/content/appcolor.dart';

class CustomImageHeader extends StatelessWidget {
  const CustomImageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                color: Appcolor.basic,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(200),
                ),
              ),
            ),

            Positioned(
              top: 230,
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Appcolor.background,
                child: CircleAvatar(
                  radius: 48,
                  backgroundImage: AssetImage('assets/image/hesham.png'),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
