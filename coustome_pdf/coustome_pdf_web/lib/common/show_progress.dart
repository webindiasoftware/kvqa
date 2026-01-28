import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:coustome_pdf_web/common/text_styles_constants.dart';

///partha paul
///show_progress
///11/12/25

Future showDialogWidget() {
  return showDialog(
    context: Get.context!,
    builder: (BuildContext context) {
      final theme = Theme.of(context);
      final colorScheme = theme.colorScheme;
      return Material(
        color: Colors.transparent,
        child: showProgressWidget(colorScheme),
      );
    },
  );
}

Widget showProgressWidget(ColorScheme colorScheme) {
  return Center(
    child: Container(
      width: 145.sp,
      height: 145.sp,
      alignment: Alignment.center,
      // padding: EdgeInsets.all(20.sp),
      decoration: BoxDecoration(
        color: Colors.white,
        // Use a large radius to make the corners very round
        borderRadius: BorderRadius.circular(15.sp),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 45.sp,
            height: 45.sp,
            child: CircularProgressIndicator(),
          ),
          SizedBox(height: 10.sp),
          Text(
            'Loading...',
            style: getText500(colors: colorScheme.primary, size: 25.sp),
          ),
        ],
      ),
    ),
  );
}

void showProgress() async {
  await Get.closeCurrentSnackbar();
  if (Get.isDialogOpen == false && Get.isSnackbarOpen == false) {
    Get.dialog(
      Center(
        child: Container(
          width: 120.sp,
          height: 120.sp,
          alignment: Alignment.center,
          // padding: EdgeInsets.all(20.sp),
          decoration: BoxDecoration(
            color: Colors.white,
            // Use a large radius to make the corners very round
            borderRadius: BorderRadius.circular(15.sp),
          ),
          child: CircularProgressIndicator(),
        ),
      ),
      // Prevent the user from closing the dialog by tapping outside
      barrierDismissible: false,
      // Use a modal barrier color to slightly darken the background
      barrierColor: Colors.black54,

      // Use the following transition to make it feel immediate
      transitionDuration: const Duration(milliseconds: 50),
    );
  }
}

void hideProgress() {
  if (Get.isDialogOpen == true) {
    Get.back(); // Use Get.back() to close the dialog
  }
}

Future<void> showErrorMessage(String title, String message) async {
  await Get.closeCurrentSnackbar();
  if (Get.isDialogOpen == false && Get.isSnackbarOpen == false) {
    Get.snackbar(
      title, // Title
      message,
      titleText: title.isEmpty ? const SizedBox.shrink() : null,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Color(0xFFC9182A),
      colorText: Colors.white,
      isDismissible: true,
      duration: const Duration(seconds: 1),
    );
    await Future.delayed(const Duration(milliseconds: 900));
    await Get.closeCurrentSnackbar();
  }
}

 Future<void> showSuccessMessage(String title, String message) async {
  await Get.closeCurrentSnackbar();
  if (Get.isDialogOpen == false && Get.isSnackbarOpen == false) {
    Get.snackbar(
      title, // Title
      message,
      titleText: title.isEmpty ? const SizedBox.shrink() : null,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      isDismissible: true,
      duration: const Duration(seconds: 1),
    );
    await Future.delayed(const Duration(milliseconds: 900));
    await Get.closeCurrentSnackbar();

  }
}
