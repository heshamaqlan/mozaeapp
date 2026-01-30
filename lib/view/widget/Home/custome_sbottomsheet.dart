import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mozaeapp/view/widget/OnBoarding/custom_button_onborading.dart';

class CustomeSbottomsheet extends StatelessWidget {
  const CustomeSbottomsheet({
    super.key,
    this.child1,
    this.child2,
    this.child3,
    this.child4,
    this.child5,
    this.child6,
    this.child7,

    required this.title,
    required this.textbutton,
    required this.onPressed,
    this.sizedBox1,
    this.sizedBox2,
    this.sizedBox3,
    this.sizedBox4,
  });
  final Widget? child1;
  final Widget? child2;
  final Widget? child3;
  final Widget? child4;
  final Widget? child5;
  final Widget? child6;
  final Widget? child7;

  final String title;
  final String textbutton;
  final void Function()? onPressed;
  final SizedBox? sizedBox1;
  final SizedBox? sizedBox2;
  final SizedBox? sizedBox3;
  final SizedBox? sizedBox4;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      child: SingleChildScrollView(
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
            const SizedBox(height: 20),

            Text(
              title.tr,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                fontFamily: "Cairo",
              ),
            ),

            // child1!,
            if (child1 != null) child1!,
            if (child2 != null) child2!,
            if (child3 != null) child3!,
            if (child7 != null) child7!,
            if (child4 != null) child4!,
            if (child5 != null) child5!,
            if (child6 != null) child6!,

            if (sizedBox1 != null) sizedBox1!,
            if (sizedBox2 != null) sizedBox2!,
            if (sizedBox3 != null) sizedBox3!,
            if (sizedBox4 != null) sizedBox4!,

            // Customtextfiled(
            //   // controller: controller.name,
            //   hintText: text,
            //   lableText: "اســـم الصنـــف",
            //   colors: Appcolor(),
            //   suffixicon: icon,
            // ),
            // Customtextfiled(
            //   // controller: controller.price,
            //   hintText: "ادخل السعر للصنف",
            //   lableText: "السعــــر",
            //   colors: Appcolor(),
            //   suffixicon: const Icon(Icons.price_change_rounded),
            // ),
            CustomButtonOnborading(
              hight: 50,
              onpressed: onPressed!,
              text: textbutton,
              wigth: 300,
            ),
          ],
        ),
      ),
    );
  }
}
