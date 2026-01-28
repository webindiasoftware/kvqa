///partha paul
///custom_app_bar
///03/01/26

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:coustome_pdf_web/app/constants/app_color_constants.dart';
import 'package:coustome_pdf_web/common/text_styles_constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String titleKey;
  final Widget? rightIcon;
  final Widget? rightIcon1;
  final VoidCallback? onBackPress;

  const CustomAppBar({
    super.key,
    required this.titleKey,
    this.rightIcon,
    this.rightIcon1,
    this.onBackPress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 2.h,
        // bottom: 8.h,
        left: 5.w,
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
          IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: AppColorConstants.primaryText, // #FFFFFF
              size: 24.sp,
            ),
            onPressed: onBackPress ?? () => Get.back(),
          ),

          Text(
            titleKey.tr, // Localization using .tr
            style: getText500(size: 18.sp, colors: Colors.black),
          ),
          Spacer(),
          (rightIcon != null) ? Container(child: rightIcon) : SizedBox(),

          (rightIcon1 != null)
              ? Container(
                  margin: EdgeInsets.only(left: 15.sp),
                  child: rightIcon1,
                )
              : SizedBox(),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60.h);
}
