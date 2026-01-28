///partha paul
///formInput_field
///27/01/26
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FormInputField extends StatelessWidget {
  final String label;
  final Function(String) onChanged;

  const FormInputField({required this.label, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.w500)),
          SizedBox(height: 8.h),
          TextFormField(
            onChanged: onChanged,
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r)),
              contentPadding: EdgeInsets.all(12.r),
            ),
          ),
        ],
      ),
    );
  }
}