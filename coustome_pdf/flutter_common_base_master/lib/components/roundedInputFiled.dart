import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:common_base/components/text_field_container.dart';
import 'package:common_base/constants/pattern_matchers.dart';

class RoundedInputFiled extends StatelessWidget {
  final String hintText;
  final ValueChanged<String> onChanged;
  final TextEditingController editingController;
  final Color hintColor;
  final Color borderColor;
  final TextInputType textInputType;
  final TextInputAction? textInputAction;
  final VoidCallback? onTap;
  final String? Function(String?)? validator;
  final FormFieldSetter<String>? onSaved;
  final bool? isReadOnly;
  final Widget? suffixIcon;
  final Color fillColor;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final EdgeInsetsGeometry? contentPadding;
  final BoxConstraints? suffixIconConstraints;
  final bool isDense;
  final FocusNode? focusNode;
  final ValueChanged<String>? onFieldSubmitted;
  const RoundedInputFiled({
    super.key,
    required this.hintText,
    required this.onChanged,
    required this.editingController,
    required this.hintColor,
    required this.borderColor,
    this.textInputType = TextInputType.text,
    this.onTap,
    this.textInputAction,
    this.validator,
    this.onSaved,
    this.isReadOnly = false,
    this.suffixIcon,
    this.fillColor = Colors.white,
    this.maxLength,
    this.maxLines,
    this.minLines,
    this.contentPadding,
    this.suffixIconConstraints,
    this.isDense = true,
    this.focusNode,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      color: Colors.transparent,
      child: TextFormField(
        keyboardType: textInputType == TextInputType.multiline
            ? TextInputType.multiline
            : textInputType == TextInputType.numberWithOptions(decimal: true) ||
                    textInputType == TextInputType.number
                ? TextInputType.number
                : TextInputType.text,
        textInputAction: TextInputAction.done,
        controller: editingController,
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        focusNode: focusNode,
        maxLines:
            textInputType == TextInputType.multiline ? (maxLines ?? 4) : 1,
        minLines:
            textInputType == TextInputType.multiline ? (minLines ?? 3) : 1,
        textAlignVertical: textInputType == TextInputType.multiline
            ? TextAlignVertical.top
            : TextAlignVertical.center,
        onChanged: onChanged,
        expands: false,
        scrollPadding: const EdgeInsets.all(20),
        maxLength: maxLength,
        autovalidateMode: AutovalidateMode.disabled,
        inputFormatters: textInputType == TextInputType.number
            ? [
                FilteringTextInputFormatter.digitsOnly, // only integers
                if (maxLength != null)
                  LengthLimitingTextInputFormatter(maxLength!),
              ]
            : textInputType == TextInputType.numberWithOptions(decimal: true)
                ? [
                    // Allow numbers with optional single dot and up to 2 decimals
                    FilteringTextInputFormatter.allow(
                      RegExp(
                        PatternMatchersConstants
                            .patternTwoDecimalNumberOnly,
                      ),
                    ),
                    if (maxLength != null)
                      LengthLimitingTextInputFormatter(maxLength!),
                  ]
                : [
                    LengthLimitingTextInputFormatter(
                        maxLength ?? 50), // limit input length
                    FilteringTextInputFormatter.deny(
                      RegExp(PatternMatchersConstants
                          .patternToRemoveEmoji), // block emojis
                    ),
                  ], // default formatting
        onTap: onTap,

        onSaved: onSaved,
        readOnly: isReadOnly ?? false,
        decoration: InputDecoration(
          filled: true,
          fillColor: fillColor,
          hintText: hintText,
          hintMaxLines: textInputType == TextInputType.multiline ? 3 : 1,
          alignLabelWithHint: textInputType == TextInputType.multiline,
          counterText: '',
          hintStyle:
              Theme.of(context).textTheme.bodyLarge!.copyWith(color: hintColor),
          suffixIcon: suffixIcon,
          isDense: isDense,
          contentPadding: contentPadding ??
              EdgeInsets.only(
                left: 12.w,
                right: suffixIcon != null ? 40.w : 12.w,
                top: (textInputType == TextInputType.multiline ? 16.h : 12.h),
                bottom:
                    (textInputType == TextInputType.multiline ? 16.h : 12.h),
              ),
          suffixIconConstraints: suffixIconConstraints,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: borderColor,
              width: 1.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: Colors.blue,
              width: 2.0,
            ),
          ),
          errorStyle: TextStyle(height: -4),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: Colors.red,
              width: 2.0,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        validator: validator ??
            (value) {
              if (value == null || value.isEmpty) {
                return '';
              }
              return null;
            },
        style: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(color: Colors.black),
      ),
    );
  }
}
