///partha paul
///custom_radio_button_field
///06/01/26

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:coustome_pdf_web/app/constants/app_color_constants.dart';
import 'package:coustome_pdf_web/common/text_styles_constants.dart';

class CustomRadioButtonField<T> extends StatelessWidget {
  final String? label;
  final T? groupValue;
  final List<T> items;
  final void Function(T?)? onChanged;
  final String Function(T) itemLabelBuilder;
  final bool isMandatory;
  final bool isHorizontal;

  const CustomRadioButtonField({
    super.key,
    this.label,
    required this.groupValue,
    required this.items,
    required this.onChanged,
    this.itemLabelBuilder = _defaultItemLabelBuilder,
    this.isMandatory = false,
    this.isHorizontal = true,
  });

  static String _defaultItemLabelBuilder(dynamic item) => item.toString();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final labelFontSize = 16.5.sp;
    final textFontSize = 18.5.sp;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 1. Label Section (Matches your Dropdown design)
        if (label != null)
          Padding(
            padding: EdgeInsets.only(bottom: 10.h),
            child: Row(
              children: [
                Text(
                  label!,
                  style: getText500(
                    colors: AppColorConstants.labelColour,
                    size: labelFontSize,
                  ),
                ),
                Visibility(
                  visible: isMandatory,
                  child: Text(
                    ' *',
                    style: TextStyle(
                      color: theme.colorScheme.error,
                      fontWeight: FontWeight.w500,
                      fontSize: labelFontSize,
                    ),
                  ),
                ),
              ],
            ),
          ),

        // 2. Radio Button Group Area
        isHorizontal
            ? Wrap(
                spacing: 20.w, // Horizontal spacing
                children: items
                    .map((item) => _buildRadioButton(item, theme, textFontSize))
                    .toList(),
              )
            : Column(
                children: items
                    .map((item) => _buildRadioButton(item, theme, textFontSize))
                    .toList(),
              ),
      ],
    );
  }

  Widget _buildRadioButton(T item, ThemeData theme, double fontSize) {
    final isSelected = item == groupValue;

    return InkWell(
      onTap: () => onChanged?.call(item),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Radio<T>(
            value: item,
            groupValue: groupValue,
            onChanged: onChanged,
            activeColor: AppColorConstants.accentBlue,
            // Matches your primary blue theme
            fillColor: WidgetStateProperty.resolveWith<Color>((states) {
              // 1. Color when the radio is SELECTED
              if (states.contains(WidgetState.selected)) {
                return AppColorConstants.accentBlue;
              }

              // 2. Color when the radio is DISABLED (onChanged is null)
              if (states.contains(WidgetState.disabled)) {
                return Colors.grey.shade300;
              }

              // 3. Default color for UNSELECTED/INACTIVE state
              return AppColorConstants.hintText;
            }),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          Text(
            itemLabelBuilder(item),
            style: theme.textTheme.headlineMedium?.copyWith(
              color: isSelected ? Colors.black : AppColorConstants.hintText,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              fontSize: fontSize,
            ),
          ),
        ],
      ),
    );
  }
}
