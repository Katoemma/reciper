import 'package:easy_loading_button/easy_loading_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:reciper/utilities/constants.dart';

class FullButton extends StatelessWidget {
  const FullButton(
      {super.key, required this.labelText, required this.onPressed});
  final String labelText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return EasyButton(
      height: 55,
      idleStateWidget: Text(
        labelText,
        style: GoogleFonts.urbanist(fontSize: 18, color: Colors.white),
      ),
      loadingStateWidget: LoadingAnimationWidget.threeArchedCircle(
          color: Colors.white, size: 20),
      buttonColor: reddish,
      borderRadius: 10.0,
      onPressed: onPressed,
    );
  }
}

class MyOutlinedButton extends StatelessWidget {
  const MyOutlinedButton(
      {super.key, required this.labelText, required this.onPressed});

  final String labelText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        minimumSize: const WidgetStatePropertyAll(Size(400, 50)),
        padding: WidgetStateProperty.all(const EdgeInsets.all(15)),
        backgroundColor: WidgetStateProperty.all(Colors.white),
        foregroundColor: WidgetStatePropertyAll(reddish),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            side: BorderSide(color: reddish, width: 1.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        labelText,
        style: GoogleFonts.urbanist(fontSize: 18),
      ),
    );
  }
}
