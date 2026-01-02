import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mozaeapp/content/appcolor.dart';
import 'package:mozaeapp/controller/auth/login_controller.dart';
import 'package:mozaeapp/view/widget/Auth/custom_textfield.dart';
import 'package:mozaeapp/view/widget/OnBoarding/custom_button_onborading.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    LogincontrollerImp controller = Get.put(LogincontrollerImp());
    return Obx(
      () => Scaffold(
        backgroundColor: Appcolor.background,
        body: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                // SizedBox(height: 50),
                Image.asset(
                  "assets/image/logo.png",
                  width: 200,
                  height: 250,
                  // fit: BoxFit.cover,
                ),
              ],
            ),
            Container(
              width: double.infinity,
              // padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Appcolor.basic.withOpacity(0.0),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Appcolor.basic.withOpacity(0.3),
                  width: 1.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Appcolor.basic.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 20,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Text(
                    "تسجيل دخول",
                    style: TextStyle(
                      color: Appcolor.basic,
                      fontFamily: "Cairo",
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                  ),
                  CustomTextfield(
                    suffixicon: Icon(Icons.person_2_rounded),
                    colors: Appcolor(),
                    hintText: "ادخل اســم المستخدم",
                    lableText: "اســـم المستخدم",
                    onChanged: (value) {
                      print(value);
                      print("هشام هشام هشام");
                    },

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'الحقل مطلوب';
                      }
                      return null;
                    },
                  ),
                  CustomTextfield(
                    suffixicon: Icon(Icons.lock_clock_rounded),
                    prefixicon: IconButton(
                      onPressed: controller.togglePasswordVisibility,
                      icon: Icon(
                        controller.isPasswordHidden.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                    colors: Appcolor(),
                    hintText: "ادخل كلمة السر",
                    lableText: "كلمـــة المـــرور",
                    // onChanged: controller.
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'الحقل مطلوب';
                      }
                      return null;
                    },
                    obscureText: controller.isPasswordHidden.value,
                  ),
                  SizedBox(height: 20),
                  CustomButtonOnborading(
                    text: "دخــــول",
                    hight: 55,
                    wigth: 180,
                    onpressed: () {
                      controller.goToHome();
                    },
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.only(right: 220),
                    child: InkWell(
                      onTap: () {
                        controller.goToForgetPassword();
                      },
                      child: Text(
                        "نسيت كلمة السر...؟",
                        style: TextStyle(
                          fontFamily: "Cairo",
                          fontSize: 15,
                          color: Appcolor.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                ],
              ),
            ),
            // SizedBox(height: 20),
            // InkWell(
            //   onTap: () {
            //     controller.goToForgetPassword();
            //   },
            //   child: Text(
            //     "نسيت كلمة السر...؟",
            //     style: TextStyle(
            //       fontFamily: "Cairo",
            //       fontSize: 15,
            //       color: Appcolor.black,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
