import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reciper/components/auth/button.dart';
import 'package:reciper/components/auth/inputs.dart';
import 'package:reciper/main.dart';
import 'package:reciper/screens/authentication/otp_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();

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
                'Forgot Password',
                style: GoogleFonts.urbanist(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Text(
              'Don\'t worry! It occurs. Please enter the email address linked with your account.',
              style: GoogleFonts.urbanist(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextInputField(
                    hintText: 'Enter your Email',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email is required';
                      }
                      final emailRegExp = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                      if (!emailRegExp.hasMatch(value)) {
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                    controller: email,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            SizedBox(height: height * 0.04),
            FullButton(
              labelText: 'Send Code',
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  try {
                    // Test with a simple query to debug
                    final response = await supabase
                        .from('profiles')
                        .select()
                        .eq('email', email.text)
                        .limit(1);

                    if (response.isNotEmpty) {
                      await supabase.auth.resetPasswordForEmail(email.text);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Reset password email sent'),
                        ),
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OtpVerificationScreen(),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(
                            'Email not Registered with Reciper',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      );
                    }
                  } catch (e) {
                    print('Error: $e');
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content:
                            Text('Failed to send reset password email: $e'),
                      ),
                    );
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
