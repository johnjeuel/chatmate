// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:overpass/controllers/authentication_controller.dart';
// import 'package:overpass/utils/common/app_strings.dart';
// import 'package:overpass/utils/common/constant.dart';
//
// class AppDrawer extends StatelessWidget {
//    AppDrawer({Key? key}) : super(key: key);
//   // final AuthenticationController _authenticationController = Get.find();
//
//   Widget ProfileInfo(){
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         ClipRRect(
//             borderRadius: BorderRadius.circular(8.0),
//             child: Icon(
//               Icons.account_circle_sharp,
//               color: kColorGray500,
//               size: 75.h,
//             )
//         ),
//         SizedBox(
//           width: 10.w,
//         ),
//         Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(_authenticationController.user.value.fullname ?? '',
//               style: TextStyle(
//                   fontSize: 16.sp,
//                   color: kColorBlack,
//                   fontWeight: FontWeight.w300
//               ),
//             ),
//             Text(_authenticationController.user.value.email ?? '',
//               style: const TextStyle(
//                 color: kColorGray500,
//                 fontWeight: FontWeight.w400,
//               ),
//             )
//           ],
//         )
//       ],
//     );
//   }
//
//   Widget DrawerItems({required VoidCallback? onTap, required String title, required String icon}){
//     return Column(
//       children: [
//         ListTile(
//           contentPadding: EdgeInsets.zero,
//           leading: Container(
//             height: 20.h,
//             width: 40.w,
//             child: Image.asset(icon,
//               fit: BoxFit.contain,
//             ),
//           ),
//           title:  Text(title,
//             style: TextStyle(
//                 fontSize: 13.sp,
//                 fontWeight: FontWeight.w400
//             ),
//           ),
//           trailing: const Padding(
//             padding: EdgeInsets.only(right: 20.0),
//             child: Icon(
//               Icons.arrow_forward_ios,
//               color: kColorBlue,
//               size: 20,
//             ),
//           ),
//           onTap: onTap,
//         ),
//         Divider(
//           thickness: 1.0,
//         )
//       ],
//     );
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       elevation: 1,
//       backgroundColor: kColorWhite,
//       child: SafeArea(
//         child: ListView(
//           padding: EdgeInsets.all(20),
//           children: [
//             ProfileInfo(),
//             SizedBox(
//               height: 20.h,
//             ),
//             DrawerItems(
//                 onTap: (){
//                   Get.toNamed('/dashboard');
//                 },
//                 title: kHome,
//                 icon: kAssetsHome),
//             DrawerItems(
//                 onTap: () =>  Get.toNamed('/leaderboard'),
//                 title: kLeaderboards,
//                 icon: kAssetsLeaderboards),
//             DrawerItems(
//                   onTap: () =>  Get.toNamed('/setting'),
//                 title: kSettings,
//                 icon: kAssetsSettings),
//             DrawerItems(
//                 onTap: (){
//                   _authenticationController.signOut();
//                   Get.toNamed('/login');
//                 },
//                 title: kLogout,
//                 icon: kAssetsLogout)
//           ],
//         ),
//       ),
//     );
//   }
// }
