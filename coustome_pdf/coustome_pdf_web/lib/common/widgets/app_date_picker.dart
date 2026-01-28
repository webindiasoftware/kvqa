/*
 * Project      : gudbuks
 * File         : app_date_picker.dart
 * Description  : Common date picker widget following design system
 * Author       : kannappan
 * Date         : 2025-12-05
 * Version      : 1.0
 * Ticket       : 
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../app/localization/translation_service_key.dart';
import 'app_text_field.dart';

/// Common date picker widget
class AppDatePicker extends StatefulWidget {
  final String? label;
  final String? hint;
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final void Function(DateTime)? onDateSelected;
  final String? Function(DateTime?)? validator;
  final bool enabled;
  final DateFormat? dateFormat;

  const AppDatePicker({
    super.key,
    this.label,
    this.hint,
    this.initialDate,
    this.firstDate,
    this.lastDate,
    this.onDateSelected,
    this.validator,
    this.enabled = true,
    this.dateFormat,
  });

  @override
  State<AppDatePicker> createState() => _AppDatePickerState();
}

class _AppDatePickerState extends State<AppDatePicker> {
  late TextEditingController _controller;
  DateTime? _selectedDate;
  final DateFormat _defaultDateFormat = DateFormat('dd/MM/yyyy');

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate;
    _controller = TextEditingController(
      text: _selectedDate != null
          ? (widget.dateFormat ?? _defaultDateFormat).format(_selectedDate!)
          : '',
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return GestureDetector(
      onTap: widget.enabled ? () => _showDatePicker(context) : null,
      child: AppTextField(
        label: widget.label,
        hint: widget.hint ?? sSelectDate.tr,
        controller: _controller,
        readOnly: true,
        enabled: widget.enabled,
        suffixIcon: Icon(
          Icons.calendar_today,
          color: colorScheme.onSurface.withOpacity(0.6),
          size: 20.sp,
        ),
        validator: (value) {
          if (widget.validator != null && _selectedDate != null) {
            return widget.validator!(_selectedDate);
          }
          return null;
        },
        onChanged: (value) {
          // Read-only field, no action needed
        },
      ),
    );
  }

  /// Show date picker dialog
  Future<void> _showDatePicker(BuildContext context) async {
    if (!widget.enabled) return;

    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final DateTime now = DateTime.now();
    final DateTime firstDate = widget.firstDate ?? DateTime(1900);
    final DateTime lastDate = widget.lastDate ?? DateTime(now.year + 100);
    final DateTime initialDate = _selectedDate ?? widget.initialDate ?? now;

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
      builder: (context, child) {
        return Theme(
          data: theme.copyWith(
            colorScheme: colorScheme,
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _controller.text =
            (widget.dateFormat ?? _defaultDateFormat).format(picked);
      });

      if (widget.onDateSelected != null) {
        widget.onDateSelected!(picked);
      }
    }
  }
}
