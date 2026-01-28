///partha paul
///custom_dropdown_field
///Updated: Hint replaced with internal search TextFormField
// lib/widgets/common/custom_dropdown_field.dart

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:coustome_pdf_web/app/constants/app_color_constants.dart';
import 'package:coustome_pdf_web/common/text_styles_constants.dart';

class CustomDropdownField<T> extends StatelessWidget {
  final String? label;
  final String? hint;
  final T? value;
  final List<T> items;
  final void Function(T?)? onChanged;
  final String Function(T) itemLabelBuilder;
  final bool isMandatory;
  final bool hasSearch;

  const CustomDropdownField({
    super.key,
    this.label,
    this.hint,
    required this.value,
    required this.items,
    required this.onChanged,
    this.itemLabelBuilder = _defaultItemLabelBuilder,
    this.isMandatory = false,
    this.hasSearch = false,
  });

  static String _defaultItemLabelBuilder(dynamic item) => item.toString();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textFontSize = 18.5.sp;
    final labelFontSize = 16.5.sp;

    // Internal controller for the search field inside the dropdown
    final TextEditingController searchController = TextEditingController();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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

        Container(
          height: 52.h,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(
                color: AppColorConstants.inputBorder,
                width: 1.2.sp,
              ),
            ),
          ),
          alignment: Alignment.centerLeft,
          child: DropdownButtonHideUnderline(
            child: DropdownButton2<T>(
              isExpanded: true,
              // value: value,
              onChanged: onChanged,
              // This is the static hint shown on the button itself
              hint: Text(
                value == null ? '$hint' : value.toString().trim(),
                style: value == null
                    ? getTextRegular(
                        colors: AppColorConstants.hintText,
                        size: textFontSize,
                      )
                    : getTextRegular(
                        colors: AppColorConstants.primaryText,
                        size: textFontSize,
                      ),
              ),
              items: items.map<DropdownMenuItem<T>>((T item) {
                return DropdownMenuItem<T>(
                  value: item,
                  child: Text(
                    itemLabelBuilder(item),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: theme.textTheme.headlineMedium?.copyWith(
                      color: colorScheme.onSurface,
                      fontWeight: FontWeight.w500,
                      fontSize: textFontSize,
                    ),
                  ),
                );
              }).toList(),

              // --- INTERNAL SEARCH TEXTFORMFIELD ---
              dropdownSearchData: hasSearch
                  ? DropdownSearchData<T>(
                      searchController: searchController,
                      searchInnerWidgetHeight: 64.h,
                      searchInnerWidget: Container(
                        height: 64.h,
                        padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 4.h),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.grey.shade200),
                          ),
                        ),
                        child: TextFormField(
                          expands: true,
                          maxLines: null,
                          controller: searchController,
                          style: TextStyle(fontSize: 17.sp),
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 10.w,
                              vertical: 8.h,
                            ),
                            hintText: 'Search...',
                            // Acts as the hint for the search field
                            hintStyle: TextStyle(
                              fontSize: 16.sp,
                              color: AppColorConstants.hintText,
                            ),
                            // --- PREFIX ICON WITH 0 PADDING ---
                            prefixIconConstraints: BoxConstraints(
                              minWidth:
                                  20.sp, // Controls the space the icon occupies
                              minHeight: 0, // Removes default vertical padding
                            ),
                            prefixIcon: Padding(
                              padding: EdgeInsetsGeometry.only(
                                left: 13.sp,
                                right: 6.sp,
                              ),
                              // Ensures icon itself has no padding
                              child: Icon(
                                Icons.search,
                                size: 20.sp,
                                color: Colors.grey,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.grey.shade50,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                              borderSide: const BorderSide(
                                color: AppColorConstants.labelColour,
                              ),
                            ),
                          ),
                        ),
                      ),
                      searchMatchFn: (item, searchValue) {
                        return itemLabelBuilder(
                          item.value as T,
                        ).toLowerCase().contains(searchValue.toLowerCase());
                      },
                    )
                  : null,

              onMenuStateChange: (isOpen) {
                if (!isOpen) {
                  searchController.clear();
                }
              },

              buttonStyleData: ButtonStyleData(
                height: 50.h,
                padding: EdgeInsets.symmetric(horizontal: 12.w),
              ),
              iconStyleData: IconStyleData(
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: colorScheme.surfaceContainerHigh,
                ),
                iconSize: 26.sp,
              ),
              dropdownStyleData: DropdownStyleData(
                maxHeight: 300.h,
                width: 320.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: Colors.white,
                ),
                offset: const Offset(0, 0),
              ),
              menuItemStyleData: MenuItemStyleData(
                height: 45.h,
                padding: EdgeInsets.symmetric(horizontal: 12.w),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
