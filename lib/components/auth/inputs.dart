import 'package:flutter/material.dart';
import 'package:reciper/utilities/constants.dart';

class CustomTextInputField extends StatelessWidget {
  final String hintText;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;

  const CustomTextInputField({
    super.key,
    required this.hintText,
    this.validator,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: neutral,
        hintStyle: TextStyle(
          color: textColor,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: neutral,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: neutral,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: neutral,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      validator: validator,
      controller: controller,
    );
  }
}

class CustomPasswordInputField extends StatefulWidget {
  final String hintText;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;

  const CustomPasswordInputField({
    super.key,
    required this.hintText,
    this.onChanged,
    this.validator,
    this.controller,
  });

  @override
  _CustomPasswordInputFieldState createState() =>
      _CustomPasswordInputFieldState();
}

class _CustomPasswordInputFieldState extends State<CustomPasswordInputField> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: !_isPasswordVisible,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: textColor,
        ),
        filled: true,
        fillColor: neutral,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: neutral,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: neutral,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: neutral,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            color: textColor,
          ),
          onPressed: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
        ),
      ),
      onChanged: widget.onChanged,
      validator: widget.validator,
      controller: widget.controller,
    );
  }
}
