///partha paul
///common_dialog
///15/12/25

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:coustome_pdf_web/app/constants/app_color_constants.dart';
import 'package:coustome_pdf_web/app/utils/app_session_manager.dart';
import 'package:coustome_pdf_web/routes/app_routes.dart';

import 'custom_text_field.dart';

// Function to show the custom GetX logout dialog
void showLogoutDialog() {
  Get.dialog(
    AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),

      // Dialog Title
      title: Text(
        'Logout',
        style: TextStyle(
          fontSize: 22.sp,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),

      // Dialog Content
      content: Text(
        'Are you sure you want to log out of your account?',
        style: TextStyle(fontSize: 18.sp, color: Colors.grey.shade700),
      ),

      // Action Buttons
      actions: [
        // Cancel Button
        TextButton(
          onPressed: () {
            Get.back(); // Closes the dialog
          },
          child: Text(
            'Cancel',
            style: TextStyle(fontSize: 18.sp, color: Color(0xFF4169E1)),
          ),
        ),

        // Confirm Logout Button
        TextButton(
          onPressed: () async {
            await AppSessionManager().clearAllSecureStorage();
            // 1. Close the dialog immediately
            Get.offAllNamed(AppRoutes.loginScreen);
            // 2. Execute Logout Logic
            // Example: Clear user session/token, then navigate to login
            // Use Get.offAllNamed or Get.offAll to clear navigation history
            // Get.offAllNamed('/login');

            // Example feedback:
            Get.snackbar(
              'Logged Out',
              'You have been successfully logged out.',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green.withOpacity(0.8),
              colorText: Colors.white,
            );
          },
          child: Text(
            'Logout',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.red.shade700, // Use a warning color
            ),
          ),
        ),
      ],
    ),
    // Allows closing by tapping outside (optional, default is true)
    barrierDismissible: true,
  );
}

// Function to show the custom GetX logout dialog
Future<void> showCancelOkDialog(
  String title,
  String message,
  Function onOkPressed, {
  String okText = 'Ok',
  String cancelText = 'Cancel',
  Color saveBgColor = AppColorConstants.labelColour,
  Color saveTextColor = Colors.white,
  Color cancelBgColor = Colors.white,
  Color cancelBorderSideColor = AppColorConstants.labelColour,
  Color cancelTextColor = AppColorConstants.labelColour,
}) async {
  await Get.dialog(
    AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),

      // Dialog Title
      title: Text(
        title,
        style: TextStyle(
          fontSize: 22.sp,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),

      // Dialog Content
      content: Text(
        message,
        style: TextStyle(fontSize: 18.sp, color: Colors.grey.shade700),
      ),

      // Action Buttons
      actions: [
        // Cancel Button
        ElevatedButton(
          onPressed: () {
            Get.back(); // Closes the dialog
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: cancelBgColor,
            elevation: 0,
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 30.w),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
          child: Text(
            cancelText,
            style: GoogleFonts.poppins(
              color: cancelTextColor,
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
            ),
          ),
        ),

        // Confirm Logout Button
        ElevatedButton(
          onPressed: () {
            onOkPressed();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: saveBgColor,
            elevation: 0,
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 30.w),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
          child: Text(
            okText,
            style: GoogleFonts.poppins(
              color: saveTextColor,
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
            ),
          ),
        ),
      ],
    ),
    // Allows closing by tapping outside (optional, default is true)
    barrierDismissible: true,
  );
}

Future<void> showRejectDialog({
  required Function(String reason) onRejectConfirmed,
  String cancelText = 'Cancel',
  Color cancelBgColor = Colors.white,
  Color cancelBorderSideColor = AppColorConstants.labelColour,
  Color cancelTextColor = AppColorConstants.labelColour,
}) async {
  final TextEditingController reasonController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  await Get.dialog(
    AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
      title: Text(
        "Reject Request",
        style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
      ),
      content: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Please provide a reason for rejection.",
              style: TextStyle(fontSize: 16.sp, color: Colors.grey.shade700),
            ),
            SizedBox(height: 16.h),
            CustomTextField(
              controller: reasonController,
              // label: 'Reject Reason',
              hint: "Enter reject reason...",
              minLines: 3,
              topBottom: 6,
              leftRight: 6,
            ),
          ],
        ),
      ),
      actions: [
        // Cancel Button
        ElevatedButton(
          onPressed: () {
            Get.back(); // Closes the dialog
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: cancelBgColor,
            elevation: 0,
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 30.w),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
          child: Text(
            cancelText,
            style: GoogleFonts.poppins(
              color: cancelTextColor,
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
            ),
          ),
        ),
        // Confirm Reject Button
        ElevatedButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              if (reasonController.text.trim().isEmpty) {
                Get.snackbar(
                  "Error",
                  "Please enter a reason for rejection",
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.red.withOpacity(0.8),
                  colorText: Colors.white,
                );
                return; // Stop execution here
              }

              // If valid, proceed with the rejection
              onRejectConfirmed(reasonController.text.trim());
              Get.back(); // Close dialog
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 30.w),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
          child: Text(
            "Reject",
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
            ),
          ),
        ),
      ],
    ),
    barrierDismissible: false,
  );
}
