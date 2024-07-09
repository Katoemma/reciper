import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:reciper/components/auth/button.dart';
import 'package:reciper/components/auth/inputs.dart';
import 'package:reciper/components/auth/social.dart';
import 'package:reciper/main.dart';
import 'package:reciper/screens/authentication/forgot_password.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset:
          true, // This property ensures the widget resizes to avoid the on-screen keyboard
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.only(right: width * 0.24),
                child: Text(
                  'Welcome back! Glad to see you, Again!',
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
                key: formKey,
                child: Column(
                  children: [
                    CustomTextInputField(
                      hintText: 'Email',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email Address is required';
                        }
                        return null;
                      },
                      controller: email,
                    ),
                    SizedBox(height: height * 0.02),
                    CustomPasswordInputField(
                      hintText: 'Password',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is required';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                      controller: password,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ForgotPasswordScreen(),
                    ),
                  );
                },
                child: const Text(
                  'Forgot Password?',
                  textAlign: TextAlign.end,
                ),
              ),
              SizedBox(height: height * 0.04),
              FullButton(
                  labelText: 'Login',
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      try {
                        final AuthResponse res =
                            await supabase.auth.signInWithPassword(
                          email: email.text,
                          password: password.text,
                        );

                        if (res.user != null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: Colors.green,
                              content: Text('Login Successful !'),
                            ),
                          );
                          //TODO: naviagte to home
                        }
                      } catch (e) {
                        if (e is AuthApiException) {
                          //show snackBar
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.red,
                              content: Text(e.message),
                            ),
                          );
                        }
                      }
                    }
                  }),
              SizedBox(height: height * 0.03),
              const Text(
                'or login with',
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
