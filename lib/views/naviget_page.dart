// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
// import 'package:walmart/controller/homecontroller.dart';
//
// class naviget_Page extends StatefulWidget {
//   const naviget_Page({super.key});
//
//   @override
//   State<naviget_Page> createState() => _naviget_PageState();
// }
//
// class _naviget_PageState extends State<naviget_Page> {
//   final homeController = Get.put(HomeController());
//
//   OntapFun(int index) {
//     setState(() {
//       homeController.currentindexnum.value = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: Container(
//         color: Color(0xFF023047),
//         child: Padding(
//           padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
//           child: GNav(
//               gap: 8,
//               backgroundColor: Color(0xFF023047),
//               color: Colors.white,
//               activeColor: Colors.white,
//               padding: EdgeInsets.all(16),
//               onTabChange: OntapFun,
//               // tabBackgroundColor: Colors.grey.shade800,
//               tabs: [
//                 GButton(
//                   icon: CupertinoIcons.home,
//                   text: 'Home',
//                 ),
//                 GButton(
//                   icon: Icons.category_outlined,
//                   text: 'Category',
//                 ),
//                 GButton(
//                   icon: CupertinoIcons.star_circle,
//                   text: 'Like\'s',
//                 ),
//                 GButton(
//                   icon: CupertinoIcons.profile_circled,
//                   text: 'Profile',
//                 ),
//               ]),
//         ),
//       ),
//     );
//   }
// }
