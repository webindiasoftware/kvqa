///partha paul
///custom_segmented_control
///12/12/25

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomSegmentedControl extends StatelessWidget {
  // Define your custom colors using the image as a guide
  Color selectedColor = const Color(0xFFC7C1EF);
  Color unselectedTextColor = Colors.grey.shade600;
  Color selectedTextColor = const Color(0xFF5552AA);
  final double borderRadius = 12.r; // Responsive radius
  final List<String> tabLabels;
  final int selectedTabIndex;
  final Function selectTab;

  CustomSegmentedControl({
    super.key,
    required this.tabLabels,
    required this.selectedTabIndex,
    required this.selectTab,
  });

  @override
  Widget build(BuildContext context) {
    // The Obx widget rebuilds only the necessary part when the selectedTabIndex changes
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    selectedTextColor = colorScheme.primary;
    selectedColor = colorScheme.secondary;
    unselectedTextColor = colorScheme.outline;
    return Container(
        margin: EdgeInsets.only(top: 15.sp),
        // Outer white container styling
        padding: EdgeInsets.all(4.r), // Small padding inside the container
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.05),
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        // Use an Expanded Row or custom logic for responsiveness
        child: Row(
          mainAxisSize: MainAxisSize.min, // Keep the row size minimal
          children: List.generate(tabLabels.length, (index) {
            bool isSelected = selectedTabIndex == index;

            return GestureDetector(
              onTap: () => selectTab(index),
              child: Container(
                // Dimensions scaled with ScreenUtil for responsiveness
                width: 140.w,
                // Example width (adjust to your designSize)
                height: 40.h,

                // Example height
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isSelected ? selectedColor : Colors.transparent,
                  borderRadius: BorderRadius.circular(
                    borderRadius - 4.r,
                  ), // Slightly smaller
                ),
                child: Text(
                  tabLabels[index],
                  style: TextStyle(
                    // Font size scaled with ScreenUtil
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w500,
                    color: isSelected ? selectedTextColor : unselectedTextColor,
                  ),
                ),
              ),
            );
          }),
        ),
      );
  }
}
