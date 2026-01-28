import 'package:flutter/material.dart';
import 'package:common_base/components/text_field_container.dart';

class RoundedInputFiledImage extends StatelessWidget {
  final String hintText;
  final Color hintColor;
  final Color borderColor;
  final TextEditingController editingController;

  const RoundedInputFiledImage(
      {Key? key,
      required this.hintText,
      required this.hintColor,
      required this.borderColor, required this.editingController,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      color: Colors.white,
      child: TextFormField(
        controller: editingController,
        enabled: false,
        decoration: InputDecoration(
          labelText: hintText,
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
          suffixIcon: Icon(Icons.arrow_drop_down_sharp)
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return hintText; // Use `return` instead of `Text()`
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
