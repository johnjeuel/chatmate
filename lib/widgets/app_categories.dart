// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:chatmate/utils/common/constant.dart';
//
// class AppCategories extends StatelessWidget {
//   final VoidCallback onPressed;
//   final String title;
//   final String icon;
//    AppCategories({required this.onPressed, required this.title, required this.icon, Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onPressed,
//       child: Column(
//         children: [
//           Container(
//             width: 90.h,
//             height: 90.h,
//             decoration: const BoxDecoration(
//               color: kColorWhite,
//               borderRadius: BorderRadius.all(Radius.circular(20))
//             ),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(20),
//               child: Image.network(
//                 icon,
//                 fit: BoxFit.fill,
//
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           Container(
//             child: Text(title.toUpperCase(),
//             style: TextStyle(
//               color: kColorGray500,
//               fontSize: 16.sp
//             ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
