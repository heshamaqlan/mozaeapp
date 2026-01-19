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