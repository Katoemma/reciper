import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:reciper/components/auth/button.dart';
import 'package:reciper/components/auth/inputs.dart';
import 'package:reciper/components/auth/social.dart';
import 'package:reciper/main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  String password = '';

  final TextEditingController userName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
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
                  'Create your account',
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
                    CustomTextInputField(
                      hintText: 'User name',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'User name is required';
                        }
                        return null;
                      },
                      controller: userName,
                    ),
                    SizedBox(height: height * 0.02),
                    CustomTextInputField(
                      hintText: 'Email',
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
                    SizedBox(height: height * 0.02),
                    CustomPasswordInputField(
                      hintText: 'Password',
                      onChanged: (value) {
                        setState(() {
                          password = value;
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
                      controller: passwordController,
                    ),
                    SizedBox(height: height * 0.02),
                    CustomPasswordInputField(
                      hintText: 'Confirm Password',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Confirm Password is required';
                        }
                        if (value != password) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              SizedBox(height: height * 0.04),
              FullButton(
                labelText: 'Register',
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    // Handle registration logic
                    try {
                      final AuthResponse response = await supabase.auth.signUp(
                          email: email.text,
                          password: passwordController.text,
                          data: {
                            'username': userName.text,
                          });

                      final User? user = response.user;
                      if (user != null) {
                        final List<Map<String, dynamic>> recordUser =
                            await supabase.from('profiles').insert({
                          'username': userName.text,
                          'email': email.text,
                        }).select();
                        if (recordUser.isNotEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: Colors.green,
                              content: Text('Account succesfully created'),
                            ),
                          );
                        }
                        //TODO: navigate to home screen
                      } else {
                        // Registration failed, show error message
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: Colors.red,
                            content: Text('Registration failed'),
                          ),
                        );
                      }
                    } catch (e) {
                      //show snackBar
                      if (e is AuthApiException) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.red,
                            content: Text(e.message),
                          ),
                        );
                      }
                    }
                  }
                },
              ),
              SizedBox(height: height * 0.03),
              const Text(
                'or register with',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: height * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialButton(
                    icon: Icons.facebook,
                    onPressed: () {},
                  ),
                  SocialButton(
                    icon: BoxIcons.bxl_google,
                    onPressed: () {},
                  ),
                  SocialButton(
                    icon: Icons.apple,
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
