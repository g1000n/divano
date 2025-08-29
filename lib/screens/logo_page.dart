import 'package:flutter/material.dart';
import 'welcome_screen.dart';

class LogoPage extends StatelessWidget {
  const LogoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF222531),
      body: GestureDetector(
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const WelcomeScreen()),
          );
        },
        child: Center(
          child: Image.asset(
            'assets/images/divano_full_logo.png', // make sure this matches your pubspec.yaml
            width: 250, // adjust size as needed
          ),
        ),
      ),
    );
  }
}
