import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reciper/components/auth/button.dart';
import 'package:reciper/utilities/constants.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.white,
        height: height,
        width: width,
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.only(right: width * 0.24),
              child: Text(
                'Create New Password',
                style: GoogleFonts.urbanist(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: height * 0.05,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomPasswordInputField(
                    hintText: 'New Password',
                    isPasswordVisible: _isPasswordVisible,
                    onVisibilityChanged: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is required';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: height * 0.02),
                  CustomPasswordInputField(
                    hintText: 'Confirm Password',
                    isPasswordVisible: _isConfirmPasswordVisible,
                    onVisibilityChanged: () {
                      setState(() {
                        _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                      });
                    },
                    validator: (value) {
                      // if (value == null || value.isEmpty) {
                      //   return 'Confirm Password is required';
                      // }
                      // if (value != _formKey.currentState?._fields['password']?.value) {
                      //   return 'Passwords do not match';
                      // }
                      // return null;
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.04,
            ),
            FullButton(
              labelText: 'Create Password',
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Handle password creation logic
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CustomPasswordInputField extends StatelessWidget {
  final String hintText;
  final bool isPasswordVisible;
  final VoidCallback onVisibilityChanged;
  final FormFieldValidator<String>? validator;

  const CustomPasswordInputField({
    Key? key,
    required this.hintText,
    required this.isPasswordVisible,
    required this.onVisibilityChanged,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: !isPasswordVisible,
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
        suffixIcon: IconButton(
          icon: Icon(
            isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            color: textColor,
          ),
          onPressed: onVisibilityChanged,
        ),
      ),
      validator: validator,
    );
  }
}
