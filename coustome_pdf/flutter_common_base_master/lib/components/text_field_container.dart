import 'package:flutter/material.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  final Color color;
  final double? height;

  const TextFieldContainer({
    super.key,
    required this.child,
    required this.color,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: height != null
          ? BoxConstraints(minHeight: height!)
          : const BoxConstraints(),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: child,
    );
  }
}
