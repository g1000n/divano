import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Custom letter colors for "welcome."
    final List<Color> letterColors = [
      const Color(0xFFFCC763), // w - yellow
      const Color(0xFF635FCC), // e - purple
      const Color(0xFF7DB9E8), // l - blue
      const Color(0xFFFC007C), // c - pink
      const Color(0xFFFCC763), // o - yellow
      const Color(0xFF7DB9E8), // m - blue
      const Color(0xFF7DB9E8), // e - blue
      const Color(0xFFFCC763), // . - yellow
    ];

    String welcomeText = "welcome.";

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.lock_open_outlined,
                  size: 80,
                  color: const Color(0xFFB4EB80),
                ),
                const SizedBox(height: 25),
                RichText(
                  text: TextSpan(
                    children: List.generate(welcomeText.length, (index) {
                      return TextSpan(
                        text: welcomeText[index],
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: letterColors[index],
                        ),
                      );
                    }),
                  ),
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      // Login action
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFB4EB80),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: OutlinedButton(
                    onPressed: () {
                      // Sign Up action
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFFB4EB80)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFFB4EB80),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // Forgot password action
                    },
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white54,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
