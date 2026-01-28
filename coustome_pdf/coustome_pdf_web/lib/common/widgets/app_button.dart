/*
 * Project      : gudbuks
 * File         : app_button.dart
 * Description  : Common button widgets following design system
 * Author       : kannappan
 * Date         : 2025-12-05
 * Version      : 1.0
 * Ticket       : 
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../app/localization/translation_service_key.dart';

/// Button type enum
enum AppButtonType {
  primary,
  secondary,
}

/// Common button widget
class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final AppButtonType type;
  final bool isLoading;
  final double? width;
  final double? height;

  const AppButton({
    super.key,
    required this.text,
    this.onPressed,
    this.type = AppButtonType.primary,
    this.isLoading = false,
    this.width,
    this.height,
  });

  /// Primary button (blue filled)
  const AppButton.primary({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.width,
    this.height,
  }) : type = AppButtonType.primary;

  /// Secondary button (white with blue border)
  const AppButton.secondary({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.width,
    this.height,
  }) : type = AppButtonType.secondary;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    if (type == AppButtonType.primary) {
      return _buildPrimaryButton(context, theme, colorScheme);
    } else {
      return _buildSecondaryButton(context, theme, colorScheme);
    }
  }

  /// Build primary button
  Widget _buildPrimaryButton(
    BuildContext context,
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    return SizedBox(
      width: width?.w,
      height: height?.h,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 12.h,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        child: isLoading
            ? SizedBox(
                width: 20.w,
                height: 20.h,
                child: CircularProgressIndicator(
                  strokeWidth: 2.w,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    colorScheme.onPrimary,
                  ),
                ),
              )
            : Text(
                text.tr,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: colorScheme.onPrimary,
                ),
              ),
      ),
    );
  }

  /// Build secondary button
  Widget _buildSecondaryButton(
    BuildContext context,
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    return SizedBox(
      width: width?.w,
      height: height?.h,
      child: OutlinedButton(
        onPressed: isLoading ? null : onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: colorScheme.primary,
          side: BorderSide(
            color: colorScheme.primary,
            width: 1.w,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 12.h,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        child: isLoading
            ? SizedBox(
                width: 20.w,
                height: 20.h,
                child: CircularProgressIndicator(
                  strokeWidth: 2.w,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    colorScheme.primary,
                  ),
                ),
              )
            : Text(
                text.tr,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: colorScheme.primary,
                ),
              ),
      ),
    );
  }
}
