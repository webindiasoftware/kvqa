/*
 * Project      : gudbuks
 * File         : otp_input_field.dart
 * Description  : OTP input field widget with 4 digits
 * Author       : kannappan
 * Date         : 2025-12-05
 * Version      : 1.0
 * Ticket       : 
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// OTP input field widget
class OtpInputField extends StatefulWidget {
  final int length;
  final Function(String) onCompleted;
  final Function(String)? onChanged;

  const OtpInputField({
    super.key,
    this.length = 4,
    required this.onCompleted,
    this.onChanged,
  });

  @override
  State<OtpInputField> createState() => _OtpInputFieldState();
}

class _OtpInputFieldState extends State<OtpInputField> {
  final List<TextEditingController> _controllers = [];
  final List<FocusNode> _focusNodes = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.length; i++) {
      _controllers.add(TextEditingController());
      _focusNodes.add(FocusNode());
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        widget.length,
        (index) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: SizedBox(
            width: 42.w,
            child: TextField(
              controller: _controllers[index],
              focusNode: _focusNodes[index],
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              maxLength: 1,
              style: theme.textTheme.headlineMedium?.copyWith(
                color: colorScheme.onSurface,
                fontSize: 22.sp
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                counterText: '',
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: colorScheme.outline,
                    width: 2.w,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: colorScheme.primary,
                    width: 2.w,
                  ),
                ),
                contentPadding: EdgeInsets.zero
              ),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],

              onChanged: (value) {
                if (value.isNotEmpty) {
                  if (index < widget.length - 1) {
                    _focusNodes[index + 1].requestFocus();
                  } else {
                    _focusNodes[index].unfocus();
                  }
                } else if (index > 0) {
                  _focusNodes[index - 1].requestFocus();
                }
                _checkCompletion();
              },
            ),
          ),
        ),
      ),
    );
  }

  /// Check if OTP is complete
  void _checkCompletion() {
    final otp = _controllers.map((c) => c.text).join();
    if (otp.length == widget.length) {
      widget.onCompleted(otp);
    }
    widget.onChanged?.call(otp);
  }
}

