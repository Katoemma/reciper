import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reciper/components/auth/button.dart';
import 'package:reciper/screens/authentication/login_screen.dart';
import 'package:reciper/utilities/constants.dart';

class PasswordSuccessfullyUpdatedScreen extends StatelessWidget {
  const PasswordSuccessfullyUpdatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          height: height,
          width: width,
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.check_circle,
                size: width * 0.4,
                color: Colors.green,
              ),
              Text(
                'Password Updated',
                style: GoogleFonts.urbanist(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              SizedBox(
                width: width * 0.6,
                child: Text(
                  'Your password has been successfully updated.',
                  style: TextStyle(
                    fontSize: 18,
                    color: textColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: height * 0.04,
              ),
              FullButton(
                labelText: 'Back to Login',
                onPressed: () {
                  // Navigate to login screen
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
