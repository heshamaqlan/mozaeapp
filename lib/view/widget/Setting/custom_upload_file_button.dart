// import 'package:flutter/material.dart';
// import 'package:mozaeapp/content/appcolor.dart';

// class CustomUplodFileButton extends StatelessWidget {
//   const CustomUplodFileButton({super.key, required this.colors});

//   final Appcolor colors;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.end,
//         children: [
//           Text(
//             'الملف الجديد',
//             style: TextStyle(
//               color: Appcolor.basic,
//               fontWeight: FontWeight.bold,
//               fontSize: 16,
//             ),
//           ),
//           SizedBox(height: 12),
//           Container(
//             width: double.infinity,
//             padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
//             decoration: BoxDecoration(
//               color: Appcolor.basic,
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: Column(
//               children: [
//                 Icon(Icons.upload_file, size: 32),
//                 SizedBox(height: 12),
//                 Text(
//                   'اختيار ملف الحركة الجديدة',
//                   style: TextStyle(
//                     color: Appcolor.basic,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 16,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 8),
//           Text(
//             ' ملاحظة : سيتم استبدال الملف الحالي بالملف الجديد *',
//             style: TextStyle(
//               color: Colors.redAccent,
//               fontWeight: FontWeight.normal,
//               fontSize: 12,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
