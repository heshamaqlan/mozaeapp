import 'package:flutter/material.dart';
import 'package:mozaeapp/content/appcolor.dart';

class CustomeSbottomsheet extends StatelessWidget {
  const CustomeSbottomsheet({
    super.key,
    // required this.title,
    required this.textlight,
    required this.textdark,
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

  final bool isSelectedlight;
  final bool isSelecteddark;
  final String imagespathlight;
  final String imagespathdark;

  final VoidCallback onTapdark;
  final VoidCallback onTaplight;

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
              ClipRRect(
                borderRadius: BorderRadius.circular(
                  16,
                ), // ✅ الحواف من الأربع جهات
                child: Image.asset(
                  imagespathdark,
                  width: 140,
                  height: 300,
                  fit: BoxFit.fill,
                ),
              ),

              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  imagespathlight,
                  width: 140,
                  height: 300,
                  fit: BoxFit.fill,
                ),
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
          // SizedBox(height: 20),
        ],
      ),
    );
  }
}
