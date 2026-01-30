import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mozaeapp/content/appcolor.dart';
import 'package:mozaeapp/controller/auth/login_controller.dart';
import 'package:mozaeapp/view/widget/Auth/custom_textfield.dart';
import 'package:mozaeapp/view/widget/OnBoarding/custom_button_onborading.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginControllerImp controller = Get.put(LoginControllerImp());

    return Obx(
      () => Scaffold(
        backgroundColor: Appcolor.background,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 80),

              Image.asset(
                "assets/image/logo.png",
                width: 200,
                height: 250,
              ),

              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Appcolor.basic.withOpacity(0.3),
                    width: 1.5,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Appcolor.basic.withOpacity(0.2),
                      blurRadius: 20,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      'login_title'.tr,
                      style: TextStyle(
                        color: Appcolor.basic,
                        fontFamily: "Cairo",
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                    ),

                    /// Email
                    CustomTextfield(
                      controller: controller.email,
                      hintText: 'enter_email',
                      lableText: 'email',
                      suffixicon: const Icon(Icons.email),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'required_field'.tr;
                        }
                        if (!value.contains('@')) {
                          return 'invalid_email'.tr;
                        }
                        return null;
                      },
                    ),

                    /// Password
                    CustomTextfield(
                      controller: controller.password,
                      hintText: 'enter_password',
                      lableText: 'password',
                      suffixicon: const Icon(Icons.lock),
                      prefixicon: IconButton(
                        onPressed: controller.togglePasswordVisibility,
                        icon: Icon(
                          controller.isPasswordHidden.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                      obscureText: controller.isPasswordHidden.value,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'required_field'.tr;
                        }
                        if (value.length < 6) {
                          return 'short_password'.tr;
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 20),

                    /// Login Button
                    CustomButtonOnborading(
                      text: controller.isLoading.value
                          ? 'logging_in'
                          : 'login',
                      hight: 55,
                      wigth: 180,
                      onpressed:
                          controller.isLoading.value
                              ? null
                              : controller.login,
                    ),

                    const SizedBox(height: 15),

                    InkWell(
                      onTap: controller.goToForgetPassword,
                      child: Text(
                        'forgot_password'.tr,
                        style: TextStyle(
                          fontFamily: "Cairo",
                          fontSize: 15,
                          color: Appcolor.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
