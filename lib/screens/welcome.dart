import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reciper/components/auth/button.dart';
import 'package:reciper/screens/authentication/login_screen.dart';
import 'package:reciper/screens/authentication/register_screen.dart';
import 'package:reciper/utilities/constants.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        color: Colors.white,
        height: height,
        width: width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('images/login.png'),
              const SizedBox(height: 20),
              Image.asset(
                'images/logo.png',
                width: width * 0.2,
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Reciping',
                    style: GoogleFonts.margarine(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Doctor',
                    style: GoogleFonts.oxygen(
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                      color: reddish,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              FullButton(
                labelText: 'Login',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
              ),
              SizedBox(
                height: height * 0.02,
              ),
              MyOutlinedButton(
                  labelText: 'Register',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterScreen(),
                      ),
                    );
                  }),
              SizedBox(
                height: height * 0.08,
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'Continue as Guest',
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    color: Colors.green,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
