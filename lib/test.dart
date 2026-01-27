// import 'package:flutter/material.dart';
// import 'package:get/get_state_manager/src/simple/get_state.dart';
// import 'package:mozaeapp/controller/Home/product_details_controlker.dart';
// import 'package:mozaeapp/view/widget/Home/customdropdown.dart';

// class Test extends StatelessWidget {
//   const Test({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<ProductDetailsControlkerrImp>(
//       init: ProductDetailsControlkerrImp(),
//       builder:
//           (controller) => Customdropdown(
//             // labelText: "التصنيف",
//             hintText: "اختر نوع المنتج",
//             prefixIcon: Icons.category,
//             value: controller.selectedValue,
//             items: controller.myItems,
//             onChanged: (val) {
//               controller.changeValue(val);
//             },
//           ),
//     );
//   }
// }

// // تغيير شكل الدائرة على يسار يمين الشاشة الرئيسيه
// //شاشة منفصله للمعلومات التطبيق
// //شاشة منفصله حول التطبيق

import 'package:flutter/material.dart';
import 'package:mozaeapp/db/core/services/fierbsse_services.dart';
import 'package:mozaeapp/view/screen/OnBoarding/Onboarding_screen.dart';

class loginnn extends StatefulWidget {
  const loginnn({super.key});

  @override
  State<loginnn> createState() => _loginnnState();
}

class _loginnnState extends State<loginnn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: emailController,
            decoration: InputDecoration(hintText: "email"),
          ),
          TextField(
            controller: passwordController,
            decoration: InputDecoration(hintText: "password"),
          ),
          ElevatedButton(
            onPressed: () async {
              try {
                await FierbsseServices.singIn(
                  emailController.text.trim(),
                  passwordController.text.trim(),
                );
                print("هشام هشام هشام");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OnboardingScreen()),
                );
              } catch (e) {
                print(e);
                print("هشام هشام هشام");
              }
            },
            child: Text("login"),
          ),

          // ElevatedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) = > ))}, child: Text("create new accont") )
        ],
      ),
    );
  }
}
