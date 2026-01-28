// lib/widgets/common/custom_text_field.dart

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:coustome_pdf_web/app/constants/app_color_constants.dart';
import 'package:coustome_pdf_web/common/text_styles_constants.dart';

class CustomTextField extends StatefulWidget {
  final String? label;
  final String? hint;
  final double? leftRight;
  final double? topBottom;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final bool enabled;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool readOnly;
  final bool isMandatory;
  final int? minLines; // Added for convenience if needed
  final String? initialValue; // Added for convenience if needed
  final bool isPassword;

  const CustomTextField({
    super.key,
    this.label,
    this.leftRight,
    this.topBottom,
    this.hint,
    this.controller,
    this.onChanged,
    this.onTap,
    this.enabled = true,
    this.inputFormatters,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.suffixIcon,
    this.readOnly = false,
    this.isMandatory = false,
    this.isPassword = false,
    this.initialValue,
    this.minLines = 1,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final FocusNode _focusNode = FocusNode();

  var isFocused = false.obs;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    // Determine font size based on responsiveness
    final textFontSize = 18.5.sp;
    final labelFontSize = 16.5.sp;

    // Check if the controller is null and an initialValue is provided, creating a temporary one
    final effectiveController =
        widget.controller ??
        (widget.initialValue != null
            ? TextEditingController(text: widget.initialValue)
            : null);

    // Listen to focus changes
    _focusNode.addListener(() {
      isFocused.value = _focusNode.hasFocus;
    });
    return Column(
      // Use Column to separate the label clearly above the field
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Display the label text clearly above the field
        if (widget.label != null)
          Padding(
            padding: EdgeInsets.only(
              bottom: widget.minLines == 1 ? 10.h : 10.h,
            ),
            child: Row(
              children: [
                Text(
                  widget.label!,
                  style: getText500(
                    // Label color is usually darker than the placeholder, but not the primary text
                    colors: AppColorConstants.labelColour,
                    size: labelFontSize,
                  ),
                ),
                SizedBox(width: 2.sp),
                Visibility(
                  visible: widget.isMandatory,
                  child: Text(
                    '*',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      color: colorScheme.error,
                      fontWeight: FontWeight.w600,
                      fontSize: labelFontSize,
                    ),
                  ),
                ),
              ],
            ),
          ),

        // The main TextField widget
        Obx(
          () => Container(
            // height: 54.h,
            // Set the height you want
            decoration:
                // widget.minLines == 1
                //     ? BoxDecoration(
                //         color: Colors.white,
                //         border: Border(
                //           bottom: BorderSide(
                //             color: isFocused.value
                //                 ? AppColorConstants.accentBlue
                //                 : AppColorConstants.inputBorder,
                //             width: isFocused.value ? 1.5.sp : 1.2.sp,
                //           ),
                //         ),
                //       )
                //     :
                BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: isFocused.value
                        ? AppColorConstants.accentBlue
                        : AppColorConstants.inputBorder,
                    width: isFocused.value ? 1.5.sp : 1.2.sp,
                  ),
                  borderRadius: BorderRadius.circular(10.r),
                ),
            alignment: Alignment.centerLeft,
            padding: widget.minLines == 1
                ? EdgeInsets.zero
                : EdgeInsets.only(
                    left: (widget.leftRight ?? 10).sp,
                    right: (widget.leftRight ?? 10).sp,
                    top: (widget.topBottom ?? 15).sp,
                    bottom: (widget.topBottom ?? 15).sp,
                  ),
            child: TextField(
              focusNode: _focusNode,
              obscureText: widget.isPassword,
              cursorColor: AppColorConstants.accentBlue,
              controller: effectiveController,
              keyboardType: widget.keyboardType,
              enabled: widget.enabled,
              readOnly: widget.readOnly,
              minLines: widget.minLines,
              maxLines: widget.minLines,
              // Minimum height
              // Pass null to onChanged if controller is readOnly to prevent unwanted behavior
              onChanged: (value) {
                // This executes the onTap logic provided by the parent
                if (widget.onChanged != null) {
                  return widget.onChanged!(value);
                }
              },
              onTap: () {
                // This executes the onTap logic provided by the parent
                if (widget.onTap != null) {
                  return widget.onTap!();
                }
              },

              // Text style for the input value
              style: theme.textTheme.headlineMedium?.copyWith(
                color: colorScheme.onSurface,
                fontWeight: FontWeight.w500,
                fontSize: textFontSize,
              ),

              decoration: InputDecoration(
                hintText: widget.hint,
                hintStyle: theme.textTheme.headlineMedium?.copyWith(
                  color: AppColorConstants.hintText,
                  fontWeight: FontWeight.w400,
                  fontSize: textFontSize,
                ),
                // We use the Column for the label, so labelText/Style and floatingLabelBehavior are removed.

                // Background and border styling
                filled: true,
                fillColor: Colors.white,
                // Use the custom color for the filled background

                // Prefix icon for fields like phone/email/calendar
                prefixIcon: widget.prefixIcon,
                prefixIconConstraints: widget.prefixIcon != null
                    ? BoxConstraints(
                        minWidth: 40.w,
                        minHeight: 40.h,
                      ) // Adjust size for icon
                    : null,

                suffixIcon: widget.suffixIcon,
                suffixIconConstraints: widget.suffixIcon != null
                    ? BoxConstraints(
                        minWidth: 40.w,
                        minHeight: 40.h,
                      ) // Adjust size for icon
                    : null,

                // **Crucial Change**: Remove all borders by setting them to InputBorder.none
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide.none,

                  // borderSide: BorderSide(
                  //   color: colorScheme.outlineVariant,
                  //   width: 2,
                  // ), // Keep e
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide.none,

                  // borderSide: BorderSide(
                  //   color: colorScheme.outlineVariant,
                  //   width: 2,
                  // ), // Keep e
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide.none,

                  // borderSide: const BorderSide(
                  //   color: Colors.red,
                  //   width: 2,
                  // ), // Keep error border
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide.none,
                  // borderSide: const BorderSide(
                  //   color: Colors.red,
                  //   width: 2,
                  // ), // Keep focused error border
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide.none,
                  // borderSide: BorderSide(
                  //   color: colorScheme.outlineVariant,
                  //   width: 2,
                  // ),
                ),
                // Padding adjustment
                contentPadding: EdgeInsets.symmetric(
                  vertical: 0.h,
                  horizontal: 5.w,
                ),
              ),
              inputFormatters: widget.inputFormatters ?? [],
            ),
          ),
        ),
      ],
    );
  }
}
