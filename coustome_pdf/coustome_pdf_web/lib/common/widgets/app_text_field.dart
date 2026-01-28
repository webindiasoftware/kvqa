/*
 * Project      : gudbuks
 * File         : app_text_field.dart
 * Description  : Common text field widget following design system
 * Author       : kannappan
 * Date         : 2025-12-05
 * Version      : 1.0
 * Ticket       : 
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../app/localization/translation_service_key.dart';

/// Text field type enum
enum AppTextFieldType {
  text,
  email,
  password,
  number,
  phone,
  amount,
  multiline,
}

/// Common text field widget
class AppTextField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? initialValue;
  final TextEditingController? controller;
  final AppTextFieldType type;
  final bool enabled;
  final bool readOnly;
  final int? maxLines;
  final int? maxLength;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final bool obscureText;

  const AppTextField({
    super.key,
    this.label,
    this.hint,
    this.initialValue,
    this.controller,
    this.type = AppTextFieldType.text,
    this.enabled = true,
    this.readOnly = false,
    this.maxLines,
    this.maxLength,
    this.validator,
    this.onChanged,
    this.onSubmitted,
    this.focusNode,
    this.textInputAction,
    this.prefixIcon,
    this.suffixIcon,
    this.inputFormatters,
    this.obscureText = false,
  });

  /// Amount field with rupee symbol
  AppTextField.amount({
    super.key,
    this.label,
    this.hint,
    this.initialValue,
    this.controller,
    this.enabled = true,
    this.readOnly = false,
    this.maxLength,
    this.validator,
    this.onChanged,
    this.onSubmitted,
    this.focusNode,
    this.textInputAction,
  })  : type = AppTextFieldType.amount,
        maxLines = 1,
        prefixIcon = null, // Will be set in build method
        suffixIcon = null,
        inputFormatters = null,
        obscureText = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    // Build prefix icon for amount field
    final Widget? finalPrefixIcon = type == AppTextFieldType.amount
        ? Icon(
            Icons.currency_rupee,
            color: colorScheme.onSurface.withOpacity(0.6),
            size: 20.sp,
          )
        : prefixIcon;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(
            label!.tr,
            style: theme.textTheme.titleMedium?.copyWith(
              color: colorScheme.onSurface,
            ),
          ),
          SizedBox(height: 8.h),
        ],
        TextFormField(
          controller: controller,
          initialValue: initialValue,
          enabled: enabled,
          readOnly: readOnly,
          obscureText: type == AppTextFieldType.password || obscureText,
          maxLines: _getMaxLines(),
          maxLength: maxLength,
          keyboardType: _getKeyboardType(),
          textInputAction: textInputAction ?? TextInputAction.next,
          focusNode: focusNode,
          validator: validator,
          onChanged: onChanged,
          onFieldSubmitted: onSubmitted,
          inputFormatters: _getInputFormatters(),
          style: theme.textTheme.bodyLarge?.copyWith(
            color: colorScheme.onSurface,
          ),
          decoration: InputDecoration(
            hintText: hint?.tr ?? sEnterText.tr,
            hintStyle: theme.textTheme.bodyLarge?.copyWith(
              color: colorScheme.onSurface.withOpacity(0.6),
            ),
            prefixIcon: finalPrefixIcon,
            suffixIcon: suffixIcon,
            filled: true,
            fillColor: colorScheme.surfaceContainerHighest,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                color: colorScheme.primary,
                width: 1.w,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                color: colorScheme.error,
                width: 1.w,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                color: colorScheme.error,
                width: 1.w,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide.none,
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 16.h,
            ),
            counterText: '',
          ),
        ),
      ],
    );
  }

  /// Get keyboard type based on field type
  TextInputType _getKeyboardType() {
    switch (type) {
      case AppTextFieldType.email:
        return TextInputType.emailAddress;
      case AppTextFieldType.number:
      case AppTextFieldType.amount:
        return const TextInputType.numberWithOptions(decimal: true);
      case AppTextFieldType.phone:
        return TextInputType.phone;
      case AppTextFieldType.multiline:
        return TextInputType.multiline;
      default:
        return TextInputType.text;
    }
  }

  /// Get max lines based on field type
  int? _getMaxLines() {
    if (maxLines != null) return maxLines;
    return type == AppTextFieldType.multiline ? null : 1;
  }

  /// Get input formatters based on field type
  List<TextInputFormatter>? _getInputFormatters() {
    if (inputFormatters != null) return inputFormatters;

    switch (type) {
      case AppTextFieldType.number:
        return [FilteringTextInputFormatter.digitsOnly];
      case AppTextFieldType.phone:
        return [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(10),
        ];
      case AppTextFieldType.amount:
        return [
          FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
        ];
      default:
        return null;
    }
  }
}
