import 'package:flutter/material.dart';


class ScreenHeader extends StatelessWidget {
  final String title;

  const ScreenHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset("assets/images/secondary_logo.png", height: 59, width: 59),
        const SizedBox(width: 2),
        Text(
          title,
          style: const TextStyle(
            fontSize: 46,
            fontWeight: FontWeight.bold,
            color: Color(0xFFD8FF76),
          ),
        ),
      ],
    );
  }
}
