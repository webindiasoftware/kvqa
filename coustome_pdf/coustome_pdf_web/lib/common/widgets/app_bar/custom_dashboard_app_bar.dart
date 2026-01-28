///partha paul
///custom_dashboard_app_bar
///04/01/26

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:coustome_pdf_web/app/constants/app_image_assets_constants.dart';
import 'package:coustome_pdf_web/common/text_styles_constants.dart';

class CustomDashboardAppBar extends StatelessWidget {
  final VoidCallback onMenuTap;
  final VoidCallback onSelectTypeTab;
  final VoidCallback onSettingsTap;
  final VoidCallback onNotificationTap;
  final String titleId;
  final bool isSelectTab;

  const CustomDashboardAppBar({
    super.key,
    required this.onMenuTap,
    required this.onSelectTypeTab,
    required this.onSettingsTap,
    required this.onNotificationTap,
    this.isSelectTab = false,
    this.titleId = "MC-0008",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        top: MediaQuery
            .of(context)
            .padding
            .top + 10.h,
        bottom: 10.h,
        left: 16.w,
        right: 16.w,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade200, width: 1),
        ),
      ),
      child: Row(
        children: [
          // 1. Menu Icon
          InkWell(
            onTap: onMenuTap,
            child: Icon(Icons.menu, color: Colors.black, size: 28.sp),
          ),
          SizedBox(width: 12.w),

          // 2. Logo and ID (Center-Left)
          GestureDetector(
            onTap: onSelectTypeTab,
            child: Row(
              children: [
                SizedBox(width: 8.w),
                Text(
                  titleId,
                  style: getText500(size: 18.sp, colors: Colors.black),
                ),
                SizedBox(width: 10.w),
                Icon(Icons.keyboard_arrow_down),
              ],
            ),
          ),


          const Spacer(),

          // 3. Right Action Buttons
          HeaderActionButton(
            icon: CupertinoIcons.settings,
            onTap: onSettingsTap,
          ),
          SizedBox(width: 13.w),
          HeaderActionButton(
            icon: CupertinoIcons.bell,
            onTap: onNotificationTap,
          ),
        ],
      ),
    );
  }
}

// Private helper widget using VoidCallback for the circular buttons
class HeaderActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final Color? mIconColor;
  final Color? mBoxDecoration;

  const HeaderActionButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.mIconColor,
    this.mBoxDecoration,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          color: mBoxDecoration ?? Colors.grey.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: mIconColor ?? Colors.black87, size: 22.sp),
      ),
    );
  }
}
