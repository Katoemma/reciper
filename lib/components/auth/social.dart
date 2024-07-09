import 'package:flutter/material.dart';
import 'package:reciper/utilities/constants.dart';

class SocialButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const SocialButton({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0.0,
      onPressed: onPressed,
      color: Colors.white,
      textColor: Colors.black,
      shape: CircleBorder(
        side: BorderSide(
          color: reddish,
          width: 1.0,
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Icon(
        icon,
        size: 24,
      ),
    );
  }
}
