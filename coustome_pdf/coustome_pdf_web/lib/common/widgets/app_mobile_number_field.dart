/*
 * Project      : gudbuks
 * File         : app_mobile_number_field.dart
 * Description  : Common mobile number field widget with label above
 * Author       : kannappan
 * Date         : 2025-12-05
 * Version      : 1.0
 * Ticket       : 
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../app/constants/app_constants.dart';

/// Common mobile number field widget with label above
class AppMobileNumberField extends StatelessWidget {
  final String? label;
  final String? hint;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final bool enabled;
  final List<TextInputFormatter>? inputFormatters;

  const AppMobileNumberField({
    super.key,
    this.label,
    this.hint,
    this.controller,
    this.onChanged,
    this.enabled = true,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return TextField(
      controller: controller,
      keyboardType: TextInputType.phone,
      enabled: enabled && controller != null,

      style: theme.textTheme.headlineMedium?.copyWith(
        color: colorScheme.onSurface,
        fontWeight: FontWeight.w600,
      ),

      decoration: InputDecoration(
        hintText: hint,
        labelText: label,
        labelStyle: theme.textTheme.headlineMedium?.copyWith(
          color: colorScheme.outline,
          fontWeight: FontWeight.w400,
          fontSize: 15.sp,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always, // Prevent floating
        filled: true, // ✅ Important
        fillColor: Colors.white, // Background color
        hintStyle: theme.textTheme.headlineMedium?.copyWith(
          color: colorScheme.onSurface,
          fontWeight: FontWeight.w400,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.sp),
          borderSide:  BorderSide(color: colorScheme.outlineVariant,width: 1.5.sp), // Normal border color
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.sp),
          borderSide:  BorderSide(color: colorScheme.outlineVariant.withValues(alpha: 0.90), width: 1.5.sp), // Focused border color
          // borderSide:  BorderSide(color: colorScheme.secondaryFixed.withValues(alpha: 0.90), width: 1.sp), // Focused border color
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.sp),
          borderSide: const BorderSide(color: Colors.red, width: 2), // Error border
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.sp),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
        contentPadding:  EdgeInsets.symmetric(
          vertical: 0.sp, // top & bottom padding
          horizontal: 12.sp, // left & right padding
        ),
      ),
      inputFormatters: inputFormatters??[],
      onChanged: controller != null ? onChanged : null,

    );
  }
}
