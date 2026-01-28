///partha paul
///table_row_widget
///27/01/26
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class TableRowWidget extends StatelessWidget {
  final String label;
  final Widget inputWidget;
  final bool isHeader;

  const TableRowWidget({
    required this.label,
    required this.inputWidget,
    this.isHeader = false
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade400)),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 4,
              child: Container(
                padding: EdgeInsets.all(12.r),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: isHeader ? Colors.grey.shade100 : Colors.white,
                  border: Border(right: BorderSide(color: Colors.grey.shade400)),
                ),
                child: Text(label, style: GoogleFonts.poppins(
                    fontSize: 13.sp,
                    fontWeight: isHeader ? FontWeight.bold : FontWeight.w500
                )),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                padding: EdgeInsets.all(8.r),
                child: inputWidget,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomDropdown extends StatelessWidget {
  final List<String> items;
  final RxString value;

  const CustomDropdown({required this.items, required this.value});

  @override
  Widget build(BuildContext context) {
    return Obx(() => DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        value: value.value,
        isExpanded: true,
        items: items.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
        onChanged: (val) => value.value = val!,
      ),
    ));
  }
}