import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:common_base/components/text_field_container.dart';

import 'DecimalTextInputFormatter.dart';

class RoundedInputDecimalFiled extends StatelessWidget {
  final String hintText;
  final ValueChanged<String> onChanged;
  final TextEditingController editingController;
  final Color hintColor;
  final String? Function(String?)? validator;
  final Color borderColor;
  final TextInputType textInputType;
  final int? decimalRange;
  final int? maxLengthBeforeDecimal;
  const RoundedInputDecimalFiled(
      {super.key,
      required this.hintText,
      required this.onChanged,
      required this.editingController,
      required this.hintColor,
        this.validator,
      required this.borderColor, this.textInputType = TextInputType.text, this.decimalRange, this.maxLengthBeforeDecimal});

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      color:  Colors.transparent,
      child: TextFormField(
        keyboardType: textInputType,
        controller: editingController,
        maxLines: 1,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
          DecimalTextInputFormatter(
            decimalRange: decimalRange ?? 2,
            maxLengthBeforeDecimal: maxLengthBeforeDecimal,
          ),
        ],
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          labelStyle:
              Theme.of(context).textTheme.bodyLarge!.copyWith(color: hintColor),
          hintText: hintText,
          hintStyle:
              Theme.of(context).textTheme.bodyLarge!.copyWith(color: hintColor),
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
        validator:validator ??  (value) {
          if (value == null || value.isEmpty) {
            return ''; // Use `return` instead of `Text()`
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
