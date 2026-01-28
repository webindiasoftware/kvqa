// ///partha paul
// ///custom_app_bar
// ///03/01/26
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:coustome_pdf_web/app/constants/app_text_constants.dart';
// import 'package:coustome_pdf_web/app/theme/app_color_constants.dart';
//
// class CustomHomeAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final VoidCallback onProfile;
//   final VoidCallback? onSettings;
//
//   const CustomHomeAppBar({super.key, required this.onProfile, this.onSettings});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.only(
//         top: MediaQuery.of(context).padding.top + 11.h,
//         left: 20.w,
//         right: 8.w,
//         bottom: 11.h,
//       ),
//       decoration: BoxDecoration(
//         color: AppColorConstants.appBackground,
//         border: Border(
//           bottom: BorderSide(
//             color: AppColorConstants.transparentGreenGlow,
//             width: 0.6.sp,
//           ),
//         ),
//       ),
//       child: Row(
//         children: [
//           // User Avatar with Online Status Indicator
//           GestureDetector(
//             onTap: () {
//               onProfile();
//             },
//             child: Row(
//               children: [
//                 Stack(
//                   children: [
//                     CircleAvatar(
//                       radius: 24.r,
//                       backgroundColor: Colors.grey,
//                       // backgroundImage: const AssetImage(
//                       //   'assets/images/user_alex.png',
//                       // ),
//                     ),
//                     Positioned(
//                       bottom: 0,
//                       right: 0,
//                       child: Container(
//                         height: 14.r,
//                         width: 14.r,
//                         decoration: BoxDecoration(
//                           color: AppColorConstants.primaryButtonBg, // #13EC13
//                           shape: BoxShape.circle,
//                           border: Border.all(
//                             color: AppColorConstants.appBackground,
//                             width: 2.w,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(width: 12.w),
//                 // Welcome Text Section
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       AppTextConstants.sWelcomeBackSmall.tr,
//                       style: GoogleFonts.inter(
//                         color: AppColorConstants.secondaryText, // #9CA3AF
//                         fontSize: 14.sp,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                     Text(
//                       AppTextConstants.sUserName.tr,
//                       style: GoogleFonts.inter(
//                         color: AppColorConstants.primaryText, // #FFFFFF
//                         fontSize: 22.sp,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//
//           const Spacer(),
//           // Settings Icon (Dynamic Right Side)
//           IconButton(
//             icon: Icon(
//               CupertinoIcons.settings,
//               color: AppColorConstants.primaryText, // #FFFFFF
//               size: 28.sp,
//             ),
//             onPressed: () => onSettings,
//           ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   Size get preferredSize => Size.fromHeight(60.h);
// }
