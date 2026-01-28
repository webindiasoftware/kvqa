import 'package:flutter/material.dart';
import 'package:common_base/components/text_field_container.dart';

class RoundedPasswordFiled extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final TextEditingController editingController;
  final Color hintColor;
  final Color borderColor;
  final String hintText;

  const RoundedPasswordFiled({Key? key, required this.onChanged, required this.editingController, required this.hintText, required this.hintColor, required this.borderColor}) : super(key: key);

  @override
  State<RoundedPasswordFiled> createState() => _RoundedPasswordFiledState();
}

class _RoundedPasswordFiledState extends State<RoundedPasswordFiled> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      color: Colors.white,
      child: TextFormField(
        obscureText: !_passwordVisible,
        controller: widget.editingController,
        decoration: InputDecoration(
          labelText: widget.hintText,
          labelStyle: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: widget.hintColor),
          hintText:  widget.hintText,
          hintStyle: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: widget.hintColor),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: widget.borderColor,
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
            borderSide: BorderSide(
              color: Colors.red,
              // Keep the error color when focused
              width: 2.0,
            ),
          ),
          suffixIcon: IconButton(
            icon: Icon(
              _passwordVisible ? Icons.visibility : Icons.visibility_off,
              color: widget.hintColor,
            ),
            onPressed: () {
              setState(() {
                _passwordVisible = !_passwordVisible;
              });
            },
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter the username'; // Use `return` instead of `Text()`
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
