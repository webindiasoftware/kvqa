///partha paul
///custom_amount_text_field
///11/12/25

// lib/widgets/common/custom_amount_text_field.dart

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAmountTextField extends StatelessWidget {
  final String? label;
  final String? hint;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final bool enabled;

  const CustomAmountTextField({
    super.key,
    this.label,
    this.hint = 'Enter amount', // Default hint text for amount fields
    this.controller,
    this.onChanged,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    // Determine font size based on responsiveness
    final textFontSize = 16.sp;
    final labelFontSize = 15.sp;

    // Custom color constants used in previous fields
    const Color customFillColor = Color(0xFFEBEFFC);
    const Color prefixIconColor = Color(0xFF757575); // Use the same color as the dropdown icon for consistency

    return Column(
      // Use Column to separate the label clearly above the field
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Display the label text clearly above the field
        if (label != null)
          Padding(
            padding: EdgeInsets.only(bottom: 8.h),
            child: Text(
              label!,
              style: theme.textTheme.headlineMedium?.copyWith(
                color: colorScheme.onSurface,
                fontWeight: FontWeight.w400,
                fontSize: labelFontSize,
              ),
            ),
          ),

        // The main TextField widget
        TextField(
          controller: controller,
          keyboardType: TextInputType.number, // Set keyboard to number for amount entry
          enabled: enabled,
          readOnly: false,

          onChanged: onChanged,

          // Input formatters to allow only digits and an optional decimal (for clean amount entry)
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
          ],

          // Text style for the input value
          style: theme.textTheme.headlineMedium?.copyWith(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.w600,
            fontSize: textFontSize,
          ),

          decoration: InputDecoration(
            hintText: hint,

            // Background color and filled status
            filled: true,
            fillColor: customFillColor, // Light purple/blue background

            // **Prefix Icon: The Indian Rupee symbol (₹)**
            prefixIcon: Padding(
              padding: EdgeInsets.only(left: 12.w, right: 4.w), // Adjust padding for symbol
              child: Text(
                '₹',
                style: theme.textTheme.headlineMedium?.copyWith(
                  color: prefixIconColor,
                  fontWeight: FontWeight.w600, // Make the symbol bold
                  fontSize: textFontSize,
                ),
              ),
            ),

            // Ensure prefix icon constraints are set correctly
            prefixIconConstraints: BoxConstraints(
              minWidth: 40.w, // Ensure it has enough width for the symbol
              minHeight: 40.h,
            ),

            hintStyle: theme.textTheme.headlineMedium?.copyWith(
              color: prefixIconColor, // Use the same grey color for the hint text
              fontWeight: FontWeight.w400,
              fontSize: textFontSize,
            ),

            // **Border Removal**
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide.none,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: const BorderSide(color: Colors.red, width: 2),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: const BorderSide(color: Colors.red, width: 2),
            ),

            // Padding adjustment
            contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
          ),
        ),
      ],
    );
  }
}