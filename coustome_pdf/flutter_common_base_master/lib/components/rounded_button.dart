import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundedButton extends StatelessWidget {
  final VoidCallback callback;
  final String title;
  final Gradient gradient;
  final Color textColor;

  const RoundedButton(
      {Key? key,
      required this.callback,
      required this.title,
      required this.textColor,
      required this.gradient})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.r)),
          ),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ).copyWith(
          backgroundColor: WidgetStateProperty.all(Colors.transparent),
          elevation: WidgetStateProperty.all(0),
        ),
        onPressed: callback,
        child: Ink(
          decoration: BoxDecoration(
            gradient: gradient,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Container(
            alignment: Alignment.center,
            constraints: BoxConstraints(minHeight: 56.h),
            child: Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(color: textColor),
            ),
          ),
        ),
      ),
    );
  }
}
