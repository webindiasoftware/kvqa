///partha paul
///custom_button
///08/12/25
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final IconData? icon;
  final Color backgroundColor;
  final Color foregroundColor;
  final VoidCallback? onPressed;
  final double fontSize;
  final double size; // For a square button size
  final double? circular; // For a square button size
  final TextStyle? style;
  final Color? borderColor;
  final double? borderWidth;

  const CustomButton({
    super.key,
    this.label = '',
    this.icon,
    required this.backgroundColor,
    required this.foregroundColor,
    this.onPressed,
    this.fontSize = 28.0,
    this.size = 70.0,
    this.circular,
    this.style,
    this.borderColor,
    this.borderWidth,
  });

  @override
  Widget build(BuildContext context) {
    final Widget childWidget =
    icon != null
        ? Icon(icon, color: foregroundColor, size: fontSize)
        : Text(
      label,
      style: style ??
          TextStyle(
            fontSize: fontSize,
            color: foregroundColor,
            fontWeight: FontWeight.normal,
          ),
    );

    final double radius = circular ?? 10.sp;

    return SizedBox(
      width: size,
      height: size,
      child: Material(
        color: Colors.transparent, // Important for border
        child: Ink(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(radius),
            border: Border.all(
              color: borderColor ?? Colors.white, // 👈 Border color
              width: borderWidth ?? 1,            // 👈 Border width
            ),
          ),
          child: InkWell(
            onTap: onPressed,
            borderRadius: BorderRadius.circular(radius),
            child: Center(child: childWidget),
          ),
        ),
      ),
    );
  }
}
