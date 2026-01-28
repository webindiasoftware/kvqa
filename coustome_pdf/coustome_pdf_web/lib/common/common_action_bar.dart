///partha paul
///common_action_bar
///05/01/26

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:coustome_pdf_web/app/constants/app_color_constants.dart';

class CommonActionBar extends StatelessWidget {
  final VoidCallback onCancel;
  final VoidCallback onSave;
  final String saveLabel;
  final String cancelLabel;
  final Color saveBgColor;
  final Color saveTextColor;
  final Color cancelBgColor;
  final Color cancelBorderSideColor;
  final Color cancelTextColor;

  const CommonActionBar({
    super.key,
    required this.onCancel,
    required this.onSave,
    this.saveLabel = "Save",
    this.cancelLabel = "Cancel",
    this.saveBgColor = AppColorConstants.labelColour,
    this.saveTextColor = Colors.white,
    this.cancelBgColor = Colors.white,
    this.cancelBorderSideColor = AppColorConstants.labelColour,
    this.cancelTextColor = AppColorConstants.labelColour,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 20.sp,
        right: 20.sp,
        bottom: 35.sp,
        top: 16.sp,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Row(
        children: [
          // Cancel Button: White background with Blue border
          Expanded(
            child: OutlinedButton(
              onPressed: onCancel,
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: cancelBorderSideColor),
                backgroundColor: cancelBgColor,
                padding: EdgeInsets.symmetric(vertical: 12.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              child: Text(
                cancelLabel,
                style: GoogleFonts.poppins(
                  color: cancelTextColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                ),
              ),
            ),
          ),
          SizedBox(width: 15.w),
          // Save Button: Solid Blue background
          Expanded(
            child: ElevatedButton(
              onPressed: onSave,
              style: ElevatedButton.styleFrom(
                backgroundColor: saveBgColor,
                elevation: 0,
                padding: EdgeInsets.symmetric(vertical: 12.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              child: Text(
                saveLabel,
                style: GoogleFonts.poppins(
                  color: saveTextColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
