import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///partha paul
///common_header
///10/12/25

Widget onlyText(String sTitle, ThemeData theme, ColorScheme colorScheme) {
  return Container(
    width: 1.sw,
    color: colorScheme.primary,
    padding: EdgeInsets.only(
      left: 30.sp,
      right: 25.sp,
      top: 48.sp,
      bottom: 10.sp,
    ),
    child: Text(
      sTitle,
      style: theme.textTheme.displayLarge?.copyWith(
        color: colorScheme.onPrimary,
        fontWeight: FontWeight.w500,
        fontSize: 30.sp,
      ),
    ),
  );
}

Widget onlyTextWithBack(
  String sTitle,
  ThemeData theme,
  ColorScheme colorScheme,
  Function onTab,
) {
  return Container(
    width: 1.sw,
    color: colorScheme.primary,
    padding: EdgeInsets.only(
      left: 20.sp,
      right: 25.sp,
      top: 48.sp,
      bottom: 10.sp,
    ),
    child: Row(
      children: [
        // GestureDetector(
        //   onTap: () {
        //     onTab();
        //   },
        //   child: Image.asset(ImageAssets.back, height: 23.sp, width: 23.sp),
        // ),
        SizedBox(width: 12.sp),
        Text(
          sTitle,
          style: theme.textTheme.displayLarge?.copyWith(
            color: colorScheme.onPrimary,
            fontWeight: FontWeight.w500,
            fontSize: 30.sp,
          ),
        ),
      ],
    ),
  );
}
