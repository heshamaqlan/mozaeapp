// import 'package:flutter/material.dart';
// import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';
// import 'package:mozaeapp/content/appcolor.dart';
// import 'package:mozaeapp/view/widget/Auth/custom_textfield.dart';

// class Forgetpassword extends StatelessWidget {
//   const Forgetpassword({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Appcolor.background,
//       appBar: AppBar(
//         backgroundColor: Appcolor.basic,
//         iconTheme: const IconThemeData(color: Colors.white),
//       ),

//       body: Column(
//         children: [
//           SizedBox(height: 70),
//           Image.asset("assets/image/password_resat_1.png", fit: BoxFit.cover),
//           SizedBox(height: 20),

//           Text(
//             "أعادة كلمة السر",
//             style: TextStyle(
//               color: Appcolor.black,
//               fontFamily: "Cairo",
//               fontSize: 22,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           SizedBox(height: 70),

//           CustomTextfield(
//             colors: Appcolor(),
//             hintText: "ادخل اسم المستخدم",
//             lableText: "اســـم المستخدم",
//             suffixicon: Icon(Icons.person_2_rounded),
//             validator: (Value) {},
//           ),
//           CustomTextfield(
//             colors: Appcolor(),
//             hintText: "ادخل البريد الالكتروني",
//             lableText: "البريد الالكتروني",
//             suffixicon: Icon(Icons.email_rounded),
//             validator: (Value) {},
//           ),
//         ],
//       ),
//     );
//   }
// }
